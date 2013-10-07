class RestaurantController < ApplicationController
	
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
			#this is where we should get the list of info and open a new tab.
			redirect_to(root_url);
		else
			redirect_to('/contact');
		end
	end
end
