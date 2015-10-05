class ChargesController < ApplicationController
before_action :authenticate_user!

def index_user
	@charges = current_user.charges.order(date: :desc)
end




def new
end

def create
	@charge = Charge.new
		@charge.invoice_id=params[:invoice][:id]
		@charge.email=stripe_params["stripeEmail"]
		@charge.date=DateTime.now
		@charge.sum=Invoice.find(params[:invoice][:id]).sum
		@charge.card_token=stripe_params["stripeToken"]
		@charge.user_id=params[:invoice][:user]

	@charge.process_payment
	@charge.save
	Invoice.find(params[:invoice][:id]).update_attribute(:status, true)
	redirect_to :back, notice: 'Dziękujemy za zapłatę'
	rescue Stripe::CardError => e
	    flash[:error] = e.message
	    render :new
	end
	#   # Amount in cents
	#   @amount = 500

	#   customer = Stripe::Customer.create(
	#     :email => 'example@stripe.com',
	#     :card  => params[:stripeToken]
	#   )

	#   charge = Stripe::Charge.create(
	#     :customer    => customer.id,
	#     :amount      => @amount,
	#     :description => 'Rails Stripe customer',
	#     :currency    => 'pln'
	#   )

	# rescue Stripe::CardError => e
	#   flash[:error] = e.message
	#   redirect_to charges_path
	# end

	private
		def stripe_params
			params.permit :stripeEmail, :stripeToken
		end

end
