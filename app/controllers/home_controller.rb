class HomeController < ApplicationController
  def index
    @products = Product.order(:name)
  end # Automatically Load: app/views/home/index.html.erb

  def search
    # No code is required here.
  end # Automatically lodas app/views/home/search.html.erb

  def search_results
    @products = Product.where("name LIKE '#{params[:keywords]}'")
  end 
end 