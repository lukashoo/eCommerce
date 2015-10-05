class InvoicesController < ApplicationController
	before_action :authenticate_user!
	before_action :admin_only, :only => [:new,:create] 

	def show
		@invoice = Invoice.find(params[:id])
		if current_user != @invoice.renter and current_user != @invoice.owner
			redirect_to my_invoices_path, notice: 'Brak uprawnień'
		end
	end
	def index_unpaid
		@invoices_o = current_user.invoices_owner.where(status: false)
		@invoices_r = current_user.invoices_renter.where(status: false)
		@charge = Charge.new
		
	end

	def index_user_invoices
		@apartments_o = current_user.apartments_as_owner
		@apartments_r = current_user.apartments_as_renter
		@charge = Charge.new
		

	end

	def new
		@invoice = Invoice.new
	end

	def create
		@invoice = Invoice.new(invoice_params)

		@invoice.date=DateTime.now
		@invoice.status=false

		if @invoice.save

			sum=0.00
			if params[:invoice][:additional_value] !=''
				invoice_item=InvoiceItem.new
				invoice_item.invoice_id=@invoice.id
				invoice_item.facility_description=params[:invoice][:additional_description]
				invoice_item.number_units=1
				invoice_item.prize_unit=params[:invoice][:additional_value]
				invoice_item.save
				sum=params[:invoice][:additional_value].to_d
			end

			#creating invoice_fields
			@invoice.apartment.apartment_facilities.each do |f|
				invoice_item=InvoiceItem.new
				invoice_item.invoice_id=@invoice.id
				invoice_item.apartment_facility_id=f.id
				invoice_item.number_units=f.number_units
				invoice_item.prize_unit=f.facility.prize_unit
				invoice_item.facility_description=f.facility.description
				sum = sum + invoice_item.number_units*invoice_item.prize_unit
				invoice_item.save
			end

			@invoice.update_attribute(:sum, sum)

			redirect_to invoice_new_path
		else
			render 'new'
		end
	end


  
  	private

  	def admin_only
    	unless current_user.admin?
      	redirect_to :back, :alert => "Access denied."
    	end
 	 end


  	def invoice_params
		params.require(:invoice).permit(:apartment_id, :pay_date, :number)
	end


end
