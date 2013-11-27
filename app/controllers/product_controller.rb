class ProductController < ApplicationController

  # Displays all products 
  # Automatically load app/views/product/index.html.erb
  def index
    @products = Product.order("model").page(params[:page]).per(3)
  end 

  # Displays individual products
  #load app/views/product/index.html.erb
  def show 
    @product = Product.find(params[:id])
  end 

  def new
    @products = Product.order("id DESC").limit(2)
  end # Loads the home/new.html.erb
end
