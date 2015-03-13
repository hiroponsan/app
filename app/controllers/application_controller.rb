class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def ranking_1
    @ranking_easy = Review.all.group(:product_id).order('fun DESC').limit(10)
  end
end
