class ReviewsController < ApplicationController
  before_filter :load_product

  def create
    @review = @product.reviews.build(review_params)
    @review.user = current_user
    respond_to do |format|
      if @review.save
        format.html do
          redirect_to product_path(@product), notice: "Your review has been posted."
        end
        format.js do
          @reviews = @product.reviews
        end
      else
        format.html do
          render 'products/show'
        end
        format.js
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @product, notice: 'Review was deleted'
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end

end
