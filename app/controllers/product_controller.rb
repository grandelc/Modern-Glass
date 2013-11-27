class ProductController < ApplicationController

  # Displays all products 
  # Automatically load app/views/product/index.html.erb
  def index
    @products = Product.all
  end 

  # Displays individual products
  #load app/views/product/index.html.erb
  def show 
    @product = Product.find(params[:id])
  end 

  def new
    @new_products = Product.all
  end # Loads the home/new.html.erb
end
