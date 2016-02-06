class ReviewsController < ApplicationController
  before_filter :load_product
  before_filter :ensure_logged_in

  def create
    @review = @product.reviews.create!(review_params)
    @review.user = current_user
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
