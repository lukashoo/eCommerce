class Charge < ActiveRecord::Base
	belongs_to :invoice
	belongs_to :user

	def process_payment
		customer = Stripe::Customer.create email: email, card: card_token

		Stripe::Charge.create customer: customer.id,
										amount: (sum * 100).to_i,
										description: 'zapłata za fakturę',
										currency: 'pln'



	end

end
