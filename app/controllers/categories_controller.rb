class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles
  end

  def category_params
    params.require(:category).permit(:name)
  end
end

