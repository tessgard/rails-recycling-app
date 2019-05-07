class ApplicationController < ActionController::Base
  # def after_sign_in_path_for(people)
  #   redirect_to my_dashboard_path
  # end
  # def 
  #   after_sign_in_path_for(people) 
  #   @sign_up_user = self.resource
  #   end

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}

        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
    end

end
