class ProductsController < ApplicationController
  before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
    @easy = @product.reviews
    @fun = @product.reviews
    @atd = @product.reviews
    
    if @reviews == []
      @report = "不明"
      @atd = "不明"
      @test = "不明"
    else

    @input_easy = @product.reviews.average(:easy).round
    @input_fun = @product.reviews.average(:fun).round

   
      input = @product.reviews.average(:report).round 
      if input >= 0.5 
        @report = "有り"
      else 
        @report = "無し"
      end

      input2 = @product.reviews.average(:attendence).round 
      if input2 >= 0.5
        @atd = "取る"
      else 
        @atd = "取らない"
      end

      input3 = @product.reviews.average(:test).round
      if input3 >= 0.5
        @test = "有り"
      else 
        @test = "無し"
      end
  end

  def search_params
    params.permit(:keyword)
  end
end
end

