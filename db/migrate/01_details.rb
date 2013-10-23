class Details < ActiveRecord::Migration
	def up
		create_table :details, Id: :serial do |t|
			t.string :info_id
			t.text   :promotion
			t.text	 :details
			t.string :reservation
			t.string :originallink
			t.string :comment
			t.string :imgfolder
			t.string :urbanspoonlink
			t.timestamps
		end
	end
end