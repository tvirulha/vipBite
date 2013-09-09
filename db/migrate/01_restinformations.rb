class Restinformations < ActiveRecord::Migration
	def change
		create_table :restaurantinfos, Id: :serial do |t|
			t.string :restaurantinfo_id
			t.string :restaurnatEmail

			t.text :restaurantPromotion

			t.integer :restaurantPhoneNo

			t.timestamps
		end
	end
end