class Facility < ActiveRecord::Base
	belongs_to :apartment_building
	belongs_to :apartment_type

	has_many :apartment_facilities
end
