class ReviewController < ApplicationController

  def edit
  end

  def update
    respond_to do |format|
      if @review.update(product_params)
        format.html { redirect_to @review, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end
  
end


