class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
      if @category.save
        flash[:alert] = "#{@category.name} has been saved as a category."
        redirect_to categories_url
      else
        render :new
      end
  end

  def show
    @category = Category.find(params[:id])
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
