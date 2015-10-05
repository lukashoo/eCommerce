class CreateApartmentBuildings < ActiveRecord::Migration
  def change
    create_table :apartment_buildings do |t|
      t.string :short_name, null: false, default: ""
      t.string :full_name, null: false, default: ""
      t.string :description
      t.string :manager
      t.string :phone
      t.string :other
      t.timestamps null: false
    end
  end
end
