class Users < ActiveRecord::Migration
	def up
		create_table :users, userId: :serial do |t|
			t.string :user_firstName
			t.string :user_lastName
			t.string :user_email

			t.string :user_type

			t.string :user_password

			t.datetime :userExpirationDate

			t.timestamp
		end
	end
end

