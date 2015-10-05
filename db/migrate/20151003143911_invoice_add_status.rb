class InvoiceAddStatus < ActiveRecord::Migration
  def change
  	add_column :invoices, :status, :boolean, default: true
  end
end
