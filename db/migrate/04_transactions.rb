class Transactions < ActiveRecord::Migration
	def change
		create_table :userTransactions, TransactrionId: :serial do |t|
			t.text :transactionConfirmation
			t.timestamps
		end

		add_reference(:userTransactions, :user)
	end
end