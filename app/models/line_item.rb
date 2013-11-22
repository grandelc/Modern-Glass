class LineItem < ActiveRecord::Base
  attr_accessible :order_id, :price, :product_id, :quantity

  validates :price, :presence => true
  validates :price, :numericality => true
  
  belongs_to :product
  belongs_to :order
end
