class HomeController < ApplicationController

  def index
    @products = Product.order(:model)
    @categories = Category.all
  end # Automatically Load: app/views/home/index.html.erb

  def search_results
    @products = Product.where("model LIKE ?", "%#{params[:keywords]}%")
  end 
end 