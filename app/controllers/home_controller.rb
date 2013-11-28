class HomeController < ApplicationController

  def index
    @products = Product.order(:model)

    # Allows to display category names
    @categories = Category.all
  end # Automatically Load: app/views/home/index.html.erb

  def search_results
    @products = Product.where("name LIKE ?", "%#{params[:keywords]}%")

    @products_model = Product.where("model LIKE ?", "%#{params[:keywords]}%")
  end 
end 