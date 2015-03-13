class TopController < ApplicationController

   def index
    product_ids = Review.group(:product_id).order('count_product_id DESC').limit(20).count(:product_id).keys
    @ranking = product_ids.map { |id| Product.find(id)}
  end

  def link
    @product = Product.find(params[:id])
  end

  def post
    Review.create(create_params)
    redirect_to action: "index"
  end

  def entry
    @product = Product.find(entry_params[:id])
  end

  def search
    @products = Product.where('title LIKE(?)', "%#{search_params[:keyword]}%").page(params[:page])
  end

private
  def entry_params
    params.permit(:id)
  end

  def search_params
    params.permit(:keyword)
  end

  def create_params
    params.permit(:report, :attendence, :test, :review, :easy, :fun, :product_id)
  end

end
