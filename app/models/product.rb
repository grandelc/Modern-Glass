class Product < ActiveRecord::Base
  attr_accessible :description, :model, :price, :ranking, :stock_quantity, :brand, :color, :style, :gender, :category_id

  validates :model, :description, :price, :presence => :true
  validates :price, :numericality => true

  has_many :line_items
  has_many :orders, :through => :line_items
  belongs_to :category
end

