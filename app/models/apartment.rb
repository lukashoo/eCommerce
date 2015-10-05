class Apartment < ActiveRecord::Base
	belongs_to :owner, :class_name => "User", :foreign_key => "user_id_1"
	belongs_to :renter, :class_name => "User", :foreign_key => "user_id_2"

	belongs_to :apartment_type
	belongs_to :apartment_building

	has_many :user_apartment_histories
	has_many :apartment_facilities
	has_many :facilities, through: :apartment_facilities
	has_many :invoices
end
