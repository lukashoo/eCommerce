class ApartmentAddAptNumber < ActiveRecord::Migration
  def change
  	add_column :apartments, :apt_number, :integer
  end
end
