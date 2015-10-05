class ApartmentBuildingsController < ApplicationController
	before_action :authenticate_user!, :only => :facilities
	before_action :admin_only, :only => :facilities

	def facilities
		@apartment_buildings=ApartmentBuilding.all
		@apartment_types=ApartmentType.all
	end


	def show
		@apartment_building=ApartmentBuilding.find(params[:id])
	end



private

  	def admin_only
    	unless current_user.admin?
      	redirect_to :back, :alert => "Access denied."
    	end
 	end
end
