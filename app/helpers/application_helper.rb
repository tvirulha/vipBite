module ApplicationHelper
	def siteTitle
		result = '';

		if @title.nil?
			result = 'Home';
		else
			result = "#{@title}"
		end
	end
end
