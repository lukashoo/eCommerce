class Address < ActiveRecord::Base
	belongs_to :apartment_building
	belongs_to :user

end
