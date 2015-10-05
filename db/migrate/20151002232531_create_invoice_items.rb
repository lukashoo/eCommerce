class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.references :invoice, index: true
      t.references :apartment_facility, index: true
      t.string :facility_description
      t.decimal :number_units, precision: 6, scale: 2
      t.decimal :prize_unit, precision: 5, scale: 2
      t.timestamps null: false
    end
  end
end
