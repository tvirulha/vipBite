class TwitterFeeds < ActiveRecord::Migration
	def up
		create_table :twitter_feed do |t|
			t.string :name
			t.text :feed
			t.datetime :update
			t.string :guid
		end
	end
end