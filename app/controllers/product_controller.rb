class ProductController < ApplicationController
  def index
    @products = Product.all
  end # Automatically load app/views/product/index.html.erb

  def show
    @product = Product.find(params[:id])
  end # Automatically load app/views/product/index.html.erb
end
