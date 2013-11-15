class Product < ActiveRecord::Base
  attr_accessible :description, :model, :price, :ranking, :stock_quantity

  has_many :line_items
  has_many :orders, :through => :line_items
end
