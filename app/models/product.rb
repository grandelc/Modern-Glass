class Product < ActiveRecord::Base
  attr_accessible :description, :model, :price, :ranking, :stock_quantity, :brand, :color, :style, :gender

  validates :model, :description, :price, :presence => :true
  validates :pirce, :numericality => true

  has_many :line_items
  has_many :orders, :through => :line_items
end
