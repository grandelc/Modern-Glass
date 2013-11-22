class Province < ActiveRecord::Base
  attr_accessible :gst, :hst, :name, :pst

  validates :name, :presence => true
  validates :gst, :hst, :pst, :numericality => true
  
  has_many :customers
end
