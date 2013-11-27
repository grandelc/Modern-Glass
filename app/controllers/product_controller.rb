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
    @products = Product.order("id DESC").page(params[:page]).per(3)
  end # Loads the home/new.html.erb

  def category
    @category = Category.find(params[:id])
    @products = Product.where(:category_id => params[:id])
  end 
end
