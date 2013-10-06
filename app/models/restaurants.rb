class Restaurants < ActiveRecord::Base

	require 'securerandom';
	require 'geocoder';

	attr_accessible :restaurantName, :address, :city, :province, :postal, :imageUrl, :longitude, :latitude, :email, :phone, :restaurantPromo, :cuisine, :modifieddate

	def self.ConvertedAddressToLatLong(restaurantName)
		rest = Restaurants.find_by_restaurantName(restaurantName);

		searchAddress = [rest.address, rest.city, rest.province, rest.postal].join(",");

		latlong = Geocoder.search(searchAddress);

		rest.update(latitude: latlong[0].latitude, longitude: latlong[0].longitude)
	end
end
