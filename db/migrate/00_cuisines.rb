class Cuisines < ActiveRecord::Migration
	def up
		create_table :cuisines,Id: :serial do |t|
			t.string :cuisine_id
			t.text :cuisineName

			t.timestamps
		end
	end
end
