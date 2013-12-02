class ProductController < ApplicationController

  # Displays all products 
  def index
    @products = Product.order("model").page(params[:page]).per(8)
    
  end 

  # Displays individual products
  def show 
    @product = Product.find(params[:id])
  end 

  # Displays new products
  def new
    @products = Product.order("id DESC").page(params[:page]).per(3)
  end # Loads the home/new.html.erb

  # Displays products in a category
  def category
     @products = Product.where(:category_id => params[:id])
     @category = Category.find(params[:id])
  end 

  # Displays products on sale
  def sale
    @products = Product.where("sale_price IS NOT NULL").page(params[:page]).per(8)
  end 
end
