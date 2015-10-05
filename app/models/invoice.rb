class Invoice < ActiveRecord::Base
	belongs_to :apartment

	delegate :owner, :to => :apartment, :allow_nil => true
	delegate :renter, :to => :apartment, :allow_nil => true

	has_many :invoice_items
	has_one :charge

	attr_accessor :additional_value
	attr_accessor :additional_description






end
