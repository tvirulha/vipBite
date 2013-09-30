class RestaurantController < ApplicationController
	
	def vipBite_ViewRestaurant
		@title = 'Restaurant';

		if(request.get?)
			@searchRestaurant = nil;
			return;
		end

		if(request.post?)
			searchCrit = params[:SearchVal];

			result = Restaurant.find_by(name: searchCrit);

			if(nil != result)
				result = Restaurant.find_by(cuisine: searchCrit);
			end

			if(nil == result)
				@searchRestaurant = result;
			else
				@searchRestaurant = nil;
			end
		end
	end
end
