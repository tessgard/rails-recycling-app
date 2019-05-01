class WelcomesController < ApplicationController
  def index

  end
  def create
    raise
    redirect_to my_dashboard_path
    super
  end
end
