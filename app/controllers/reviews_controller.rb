class ReviewsController < ApplicationController
  before_filter :load_product

  def create
    @review = @product.reviews.create!(review_params)
    redirect_to @product, notice: "Review was created."
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end

end
