class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :apartment, index: true
      t.timestamp :date
      t.decimal :sum, precision: 7, scale: 2
      t.timestamps null: false
    end
  end
end
