class TwitterFeeds < ActiveRecord::Base
	atrr_accessible :name, :summary, :guid, :updateat

	def self.get_tweets(delaytimer = 30.minutes)
		Twitter.favorites("vipBite", since_id: maximum(:tweet_id)).each dp |tweet|
			unless exists?(guid: tweet.id)
				create!(guid: tweet.id, summary: tweet.text,
				        name: tweet.user.screen_name, updateat: twitter.created_at)
			end
	end
end
