class Restaurants < ActiveRecord::Migration
	def change
		create_table :restaurants, restaurantId: :serial do |t|
			t.string :restaurantName
			t.string :address
			t.string :city
			t.string :province
			t.string :postal
			t.string :imageUrl

			t.float :longitude
			t.float :latidude

			t.timestamps
		end

		add_column(:restaurants, :cuisine_id, :string, :null => false)
		add_column(:restaurants, :restinformations_id, :string, :null => false)
	end
end
