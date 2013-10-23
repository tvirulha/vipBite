VipBite::Application.routes.draw do

	match '/register', :to => 'account#vipBite_Register', via:[:get, :post]
	match '/restaurant', :to => 'restaurant#vipBite_ViewRestaurant', via:[:get, :post]
	match '/login', :to => 'sessions#vipBite_LogIn', via:[:post]
  match '/logout', :to => 'sessions#vipBite_LogOut', via:[:get]
  match '/forgetpassword', :to => 'account#vipBite_PwdRecovery', via:[:get, :post]
  match '/internal_register', :to => 'account#vipBite_SubmitRegisterationForm', via:[:post]
  match '/account', :to => 'account#vipBite_Account', via:[:get, :post]
  match '/renew', :to => 'account#vipBite_RenewMembership', via:[:get, :post]
  match '/aboutus', :to => 'home#vipBite_AboutUs', via:[:get]
  match '/contact', :to => 'home#vipBite_ContactUs', via:[:get, :post]
  match '/restaurant_info', :to => 'restaurant#vipBite_FullRestaurantInfo', via:[:get, :post]
  
	root to: 'home#vipBite_Index'
end
