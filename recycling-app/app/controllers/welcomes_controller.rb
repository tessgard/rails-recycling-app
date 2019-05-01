class WelcomesController < ApplicationController
  def index

  end
  def people_dashboard 
    @user = current_user
    @products = Product.where(user_id: current_user.id)
  end 

  def create
    raise
    redirect_to my_dashboard_path
    super
  end
end
