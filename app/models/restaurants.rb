class Restaurants < ActiveRecord::Base

	require 'securerandom';
	require 'geocoder';


	has_many :restinformations, :foreign_key => :restaurant_id
	has_many :cuisines, :foreign_key => :cuisine_id
	attr_accessible :restaurantName, :address, :city, :province, :postal, :imageUrl, :cusine_id, :restaurantifos_id

	def self.AddNewRestaurant(restaurantName, address, city, prov, postal, image, cuisine, email, phone, promotion)
		isExist = Restaurants.find_by_restaurantName(restaurantName);

		if(isExist)
			return false;
		else
			begin
				uuid = SecureRandom.uuid;
				uuidexist = Restinformations.find_by_restaurantinfo_id(uuid);
			end while(uuidexist)

			latlong = ConvertedAddressToLatLong(address, city, prov, postal);

			cId = Cuisines.find_by_cuisineName(cuisine);
			rinfo = Restinformations.create(:restaurantinfo_id => uuid, :restaurnatEmail => email, :restaurantPromotion => promotion, :restaurantPhoneNo => phone);
			newrestaurant = Restaurants.create( :resaturantName => restaurantName, 
												:address => address, 
												:city => city, 
												:province => prov, 
												:postal => postal, 
												:imageUrl => image, 
												:latitude => latlong[0],
												:longtitude => latlong[1],
												:cuisine_id => cId, 
												:restinformations_id => rinfo.restaurant_id);
			return true;
		end
	end

	def self.UpdateExistingRestaurant(restaurantName, address, city, prov, postal, image, email, phone, promotion)
		foundRestaurant = Restaurants.find_by_restaurantName(restaurantName);

		if(foundRestaurant)
			foundRestaurant.address = address;
			foundRestaurant.city = city;
			foundRestaurant.province = prov;
			foundRestaurant.postal = postal;
			foundRestaurant.imageUrl = image;
			foundRestaurant.save;

			restInfo = Restinformations.find_by_restaurantinfo_id(foundRestaurant.restinformations_id);
			restInfo.restaurantEmail = email;
			restInfo.restaurantPromotion = promotion;
			restInfo.restaurantPhoneNo = phone;
			restInfo.save;

			return true;
		else
			return false;
		end
	end

	def self.ImageUrl=(image)
	end

	def ConvertedAddressToLatLong(address, city, prov, postal)
		searchAddress = [address, city, prov, postal].join(",")

		latlong = Geocoder.search(searchAddress);

		return [latlong[0].latitude, latlong[0].longtitude];
	end
end
