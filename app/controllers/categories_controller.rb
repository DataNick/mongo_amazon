class CategoriesController < ApplicationController
  before_action :load_product

  def index
    @categories = @product.category
  end

  def show
  end

  def create
    @category = @product.category.build(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @product, notice: 'Category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @category }
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category/1
  # PATCH/PUT /category/1.json
  def update
    respond_to do |format|
      if @category.update_attributes(category_params)
        format.html { redirect_to [@product, @category], notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
  # Use callbacks to share common setup or constraints between actions.
  # def set_category
  #   @category = @product.category.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.


  def load_product
    @product = Product.find(params[:product_id])
  end

end
