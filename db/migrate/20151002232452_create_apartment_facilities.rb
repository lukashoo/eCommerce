class CreateApartmentFacilities < ActiveRecord::Migration
  def change
    create_table :apartment_facilities do |t|
      t.references :facility, index: true
      t.references :apartment, index: true
      t.decimal :number_units, precision: 6, scale: 2
      t.timestamps null: false
    end
  end
end
