class CreateUserApartmentHistories < ActiveRecord::Migration
  def change
    create_table :user_apartment_histories do |t|
      t.references :user, index: true
      t.references :apartment, index: true
      t.integer :ownership_type
      t.timestamp :start_date
      t.timestamp :end_date
      t.timestamps null: false
    end
  end
end
