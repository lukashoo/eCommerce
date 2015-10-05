class InvoiceAddAnother < ActiveRecord::Migration
  def change
  	add_column :invoices, :pay_date, :timestamp
  	add_column :invoices, :operation_date, :timestamp
  end
end
