class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
    @easy = @product.reviews
    @fun = @product.reviews
    if @reviews == []
      @report = "不明"
      @atd = "不明"
      @test = "不明"
    else
      input = @product.reviews.average(:report).round 
      if input >= 0.5 
        @report = "有り"
      else 
        @report = "無し"
      end

      input2 = @product.reviews.average(:attendence).round 
      if input2 >= 0.6
        @atd = "毎回取る"
      if @atd == 0.5 
        @atd = "たまに取る"
      else 
        @atd == "取らない"
      end



      input3 = @product.reviews.average(:test).round
      if input3 >= 0.5
        @test = "有"
      else 
        @test = "無"
      end
    end
  end

  def show_professer
    @product = Product.find(params[:id])
  end

  def search_params
    params.permit(:keyword)
  end
end
end

