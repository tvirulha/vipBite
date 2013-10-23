class RestaurantController < ApplicationController
	require 'find'

	def vipBite_ViewRestaurant
		@title = 'Restaurant';

		if(request.get?)
			@searchRestaurant = nil;
			return;
		end

		if(request.post?)
			searchCrit = params[:SearchVal];

			result = Restaurants.where(restaurantName: searchCrit);
			
			if(result.count == 0)
				result = Restaurants.where(cuisine: searchCrit);
			end

			if(result.count != 0)
				@searchRestaurant = result;
			else
				@searchRestaurant = nil;
			end
		end
	end

	def vipBite_FullRestaurantInfo
		if(params[:restaurant] != nil)
			result_overview = Restaurants.where(restaurantName: params[:restaurant]);

			if(result_overview.count != 1)
				redirect_to('/contact') and return;
			else
				result_info = Details.find_by_info_id(result_overview[0].info_id);
			end

			@Name = result_overview[0].restaurantName;
			@Deal = result_info.promotion;
			#@Detail = result_info.details;
			@Reservation = result_info.reservation;
			@Phone = result_overview[0].phone;
			@Hours = result_info.originallink;
			@Comment = result_info.comment;
			@urbanspoonlink = result_info.urbanspoonlink;

			@Latitude = result_overview[0].latitude;
			@Longitude = result_overview[0].longitude;

			
			@Images = []

			Dir.glob("public/Image/restaurant/" << "test" << "/*").each do |file|
				@Images.push(file.split('/')[1..-1].join('/'));
			end
			
		else
			redirect_to('/contact') and return;
		end
	end
end
