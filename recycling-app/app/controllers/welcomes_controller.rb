class WelcomesController < ApplicationController
  def index
    @products = Product.all.sample(5)
    @image_name = ''

    @products.each do |product|
      if product.category == "Glass"
        @image_name = "glass.jpg"
      elsif product.category == "Cardboards"
        @image_name = "cardboard.jpg"
      end
    end

  end


  def people_dashboard 
    @user = current_user
    @products = Product.where(user_id: current_user.id)
  end 
  def business_dashboard
    @business = current_business
    @products = Product.where(business_id: current_business.id)
  end

  def create
    raise
    redirect_to my_dashboard_path
    super
  end

end
