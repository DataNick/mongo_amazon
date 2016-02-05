class ReviewsController < ApplicationController
  before_filter :load_product

  def create
    @review = @product.reviews.build(params[:review])
    redirect_to @product, notice: "Review was created."
  end

  private

  def load_product
    @product = Product.find(params[:product_id])
  end

end
