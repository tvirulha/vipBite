class HomeController < ApplicationController
	def vipBite_Index
		@title = 'Home';
	end

	def vipBite_HowItWor
		@title = 'How it Wrok';
	end

	def vipBite_ContactUs
		if (request.post?)
			return
		elsif (request.get?)
			return
		end
	end
end
