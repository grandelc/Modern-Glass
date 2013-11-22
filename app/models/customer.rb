class Customer < ActiveRecord::Base
  attr_accessible :addres, :city, :country, :email, :first_name, :last_name, :postal_code, :province_id

  validates :first_name, :last_name, :presence => :true 

  belongs_to :province 
  has_many :orders
end
