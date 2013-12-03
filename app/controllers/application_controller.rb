class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_categories, :load_pages, :init

  protected

    def load_categories
       @categories = Category.all
    end

    def load_products
      @products = Product.all
    end 

    def load_pages
      @pages_1 = Page.all
    end

    def init
      session[:cart] ||= []
      @cart_prod = []

      session[:cart].each do |id| 
        # Adds the products into the cart 
        @cart_prod << Product.find(id)
      end

      session[:cart_count] ||= 0
      @visit_count = session[:visit_count]
    end 

end
