class HomeController < ApplicationController

  def index
    @products = Product.order(:name)
  end # Automatically Load: app/views/home/index.html.erb

  def search
    # No code is required here.
  end # Automatically lodas app/views/home/search.html.erb

  def search_results
    @products = Product.where("model LIKE ?", "%#{params[:keywords]}%")
  end 

  def category
    @ray_bans = Category.find(:params[:id])
  end 
end 