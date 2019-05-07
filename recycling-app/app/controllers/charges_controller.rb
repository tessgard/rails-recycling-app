class ChargesController < ApplicationController
  def new
  end
  
  def create
    # Amount in cents
  
    user_id = User.find(params[:user_id]).id
    product_id = Product.find(params[:product_id]).id
    business_id = Business.find(params[:business_id]).id
    @amount = 1000
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: 1000,
      description: 'Rails Stripe customer',
      currency: 'aud',
    })

    @transaction = Transaction.create({
      user_id: user_id,
      product_id: product_id,
      business_id: business_id
    })
    product = Product.find(product_id)  
    product.state = false
    product.save
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
