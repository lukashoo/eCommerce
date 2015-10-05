class AddUserFields < ActiveRecord::Migration
  def change
  	add_column :users, :surname, :string
  	add_column :users, :other, :string
  end
end
