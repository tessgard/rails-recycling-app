class WelcomesController < ApplicationController
  def index

  end
  def people_dashboard 
    @user = current_user
  end 
  def create
    raise
    redirect_to my_dashboard_path
    super
  end
end
