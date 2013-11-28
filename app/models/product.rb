class Product < ActiveRecord::Base
  attr_accessible :description, :model, :price, :ranking, :stock_quantity, :brand, 
                  :category_id, :image, :name, :sale_price

  validates :model, :description, :price, :presence => :true
  validates :price, :numericality => true
  validates :model, :name, :uniqueness => :true

  has_many :line_items
  has_many :orders, :through => :line_items
  belongs_to :category

  has_attached_file :image, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png" 
end

