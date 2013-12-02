class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_categories, :load_pages

  protected
  def load_categories
     @categories = Category.all
  end

  def load_pages
    @pages = Page.all
  end
end
