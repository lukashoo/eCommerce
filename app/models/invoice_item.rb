class InvoiceItem < ActiveRecord::Base
	belongs_to :invoice
	belongs_to :apartment_facility
	delegate :facility, :to => :apartment_facility, :allow_nil => true


end
