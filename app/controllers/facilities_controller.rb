class FacilitiesController < ApplicationController
before_action :authenticate_user!
before_action :admin_only


	def edit
		@facilities=Facility.all.where('apartment_building_id= ? AND apartment_type_id= ?', params[:id_1], params[:id_2])
	end

	def show
		@facility = Apartment.find(params[:id])
	end

	def update
		@facility = Facility.find(params[:id])

	    
	    if @facility.update_attributes(secure_params)
	    	redirect_to request.referer, :notice => "Uaktualniono dane."
	    else
	    	redirect_to request.referer, :notice => "Błąd."
	    end
	end


	private

  	def admin_only
    	unless current_user.admin?
      	redirect_to :back, :alert => "Access denied."
    	end
 	end

 	def secure_params
    	params.require(:facility).permit(:prize_unit)
 	end
end
