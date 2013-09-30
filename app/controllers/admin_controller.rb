class AdminController < ApplicationController

  def adminIndex
  	if(IsAdminUser(cookies[:user_Id])) 
  		raise ActionController::RoutingError.new('Not Found')
  	else
  		render 'adminIndex';
  	end
  end

  def AddNewRestaurant
  end

  def ManageRestaurant
  end
end
