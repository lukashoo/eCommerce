class ApartmentBuilding < ActiveRecord::Base
	has_many :apartments
	has_one :address
	has_many :facilities 

end
