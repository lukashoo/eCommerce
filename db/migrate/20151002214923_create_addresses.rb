class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true
      t.references :apartment_building, index:true
      t.string :town_city
      t.string :street
      t.string :zip_postcode
      t.string :country
      t.timestamps null: false
    end
  end
end
