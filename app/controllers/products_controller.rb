class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
    @easy = @product.reviews.average(:easy)
    @fun = @product.reviews.average(:fun)
    if @reviews == []
      @reviews = "まだレビューがありません"
      @report = "不明"
      @atd = "不明"
      @test = "不明"
    else
      input = @product.reviews.average(:report).round 
      if input >= 0.5 
        @report = "有"
      else 
        @report = "無"
      end

      input2 = @product.reviews.average(:attendence).round 
      if input2 >= 0.5
        @atd = "有"
      else 
        @atd = "無"
      end

      input3 = @product.reviews.average(:test).round
      if input3 >= 0.5
        @test = "有"
      else 
        @test = "無"
      end
    end
  end

end
