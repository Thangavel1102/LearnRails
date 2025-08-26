class PaymentsController < ApplicationController
  def new
  end

  def create
    customer = Stripe::Customer.create(
      email: params[:email],
      source: params[:stripeToken]
    )
    
    amount = params[:amount].to_i
    raise 'Invalid amount' if amount < 100
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: 'Stripe payment of $500',
      currency: 'usd'
    )

    redirect_to articles_path, alert: 'Payment done successfully'
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_payment_path
    end
end
