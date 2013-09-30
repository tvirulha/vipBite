class Promotions < ActiveRecord::Migration
	def up
		create_table :promotions,Id: :serial do |t|
			t.string :promotions_id
			t.text :promotion

			t.timestamps
		end
	end
end