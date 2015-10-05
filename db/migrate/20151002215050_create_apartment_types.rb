class CreateApartmentTypes < ActiveRecord::Migration
  def change
    create_table :apartment_types do |t|
      t.string :description
      t.timestamps null: false
    end
  end
end
