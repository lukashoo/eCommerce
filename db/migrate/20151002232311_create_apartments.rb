class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.references :apartment_building, index: true
      t.references :apartment_type, index: true
      t.decimal :bathroom_count, precision: 2, scale: 0
      t.decimal :bedroom_count, precision: 2, scale: 0
      t.decimal :room_count, precision: 2, scale: 0
      t.string :other

      t.timestamps null: false
    end

    add_column :apartments, :user_id_1, :integer
    add_column :apartments, :user_id_2, :integer
  	add_foreign_key :apartments, :users, column: :user_id_1, primary_key: :id
  	add_foreign_key :apartments, :users, column: :user_id_2, primary_key: :id


  end
end
