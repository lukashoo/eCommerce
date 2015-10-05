class ApartmentFacility < ActiveRecord::Base
	belongs_to :apartment
	belongs_to :facility
end
