class RestaurantController < ApplicationController
	
	def vipBite_ViewRestaurant
		@title = 'Restaurant';

		if(request.get?)
			flash[:warning] = nil;
			return;
		end

		if(request.post?)
			return;
		end
	end
end
