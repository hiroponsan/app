class TopController < ApplicationController
  before_action :authenticate_user!, except: :index

   def index
    product_ids = Review.group(:product_id).order('count_product_id DESC').limit(20).count(:product_id).keys
    @ranking = product_ids.map { |id| Product.find(id)}
  end

  def easy
    @ranking = Review.all.order('easy DESC').limit(20)
  end

  def fun 
    @ranking = Review.all.order('fun DESC').limit(20)
  end

  def link
    @product = Product.find(params[:id])
  end

  def error
  end

  def pre_search
    @products = Product.where('title LIKE(?)', "%#{search_params[:keyword]}%").page(params[:page])
  end

  def pre_search_review
    @products = Product.where('title LIKE(?)', "%#{search_params[:keyword]}%").page(params[:page])
  end

  def pre_search_entry
    @products = Product.where('title LIKE(?)', "%#{search_params[:keyword]}%").page(params[:page])
  end

  def search_2
    @products = Product.where('title LIKE(?)', "%#{search_params[:keyword]}%").page(params[:page])
  end

  def search_3
    @products = Product.where('title LIKE(?)', "%#{search_params[:keyword]}%").page(params[:page])
  end

  def edit
  end

  def show 
    @product = Product.find(params[:id])
  end
  


def thank_you 

end






  def post
   @review = current_user.reviews.create(create_params)
   if @review.save
   redirect_to action: "thank_you"
 elsif @review
  redirect_to action: "post"
  flash[:notice] =  "✴︎コメントは最低でも１文字以上お書きください"
end
 end


  def entry
    @product = Product.find(entry_params[:id])
  end

   def review
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
