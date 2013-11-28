class HomeController < ApplicationController

  def index
    @products = Product.order(:model)

    # Allows to display category names
    @categories = Category.all
  end # Automatically Load: app/views/home/index.html.erb

  def search_results

    @category = Category.where("name LIKE ?", "%#{params[:keywords]}%")

    if (@category.first.nil?)
      @products = Product.where("name LIKE ? OR model LIKE ?",
                               "%#{params[:keywords]}%", "%#{params[:keywords]}%").page(params[:page]).per(9)
    else
      @products = Product.where("name LIKE ? OR model LIKE ? OR category_id LIKE ?",
                               "%#{params[:keywords]}%", "%#{params[:keywords]}%", "%#{@category.first.id}%").page(params[:page]).per(9)
    end 
  end
end 