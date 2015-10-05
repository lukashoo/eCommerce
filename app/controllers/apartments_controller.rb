class ApartmentsController < ApplicationController
before_action :authenticate_user!
	def index_user
		@apartments_o = current_user.apartments_as_owner
		@apartments_r = current_user.apartments_as_renter
	end

	def show
		@apartment = Apartment.find(params[:id])
	end

	def update_user
	    @apartment = Apartment.find(params[:id])
	    user_id_temp = @apartment.user_id_2
	    if @apartment.update_attributes(secure_params)
	    	#history END
	    	if params[:apartment][:user_id_2] == ''
	    		history = UserApartmentHistory.where('user_id= ? AND apartment_id= ?', user_id_temp, @apartment.id).order(created_at: :desc).first
	    		history.update_attribute('end_date', DateTime.now)
	    		
	    	#history START
	    	else
	    		history = UserApartmentHistory.new
	    		history.start_date = DateTime.now
	    		history.apartment_id = @apartment.id
	    		history.user_id = params[:apartment][:user_id_2]
	    		history.ownership_type = 2
	    		history.save
	    	end



	      redirect_to apt_bd_fac_path, :notice => "Uaktualniono dane."
	    else
	      redirect_to apt_bd_fac_path, :alert => "Błąd"
	    end
  	end




  private

  def secure_params
    params.require(:apartment).permit(:user_id_2)
  end

end
