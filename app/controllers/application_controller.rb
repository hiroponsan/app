class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception




  def ranking_1
    @ranking_easy = Review.all.group(:product_id).order('fun DESC').limit(10)
  end

   before_filter :configure_permitted_parameters, if: :devise_controller?
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nickname, :email, :depart, :password, ) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:current_password, :nickname, :depart) }
    end

end
