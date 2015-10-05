class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.references :invoice, index: true
      t.string :email
      t.datetime :date
      t.decimal :sum, precision: 7, scale: 2
      t.string :card_token
      t.timestamps null: false
    end
  end
end
