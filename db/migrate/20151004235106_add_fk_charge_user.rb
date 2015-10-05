class AddFkChargeUser < ActiveRecord::Migration
  def change
  	add_column :charges, :user_id, :integer
  	add_foreign_key :charges, :users, column: :user_id, primary_key: :id
  end
end
