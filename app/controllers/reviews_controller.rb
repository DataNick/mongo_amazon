class ReviewsController < ApplicationController
  before_filter :load_product

  def create
    @review = @product.reviews.build(review_params)

  end

  private

  def load_product
    @product = Product.find(params[:product_id])
  end

end
