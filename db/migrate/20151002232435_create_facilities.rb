class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.references :apartment_building, index: true
      t.references :apartment_type, index: true
      t.string :description
      t.decimal :prize_unit, precision: 5, scale: 2
      t.timestamps null: false
    end
  end
end
