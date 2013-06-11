class Route < ActiveRecord::Base
  attr_accessible :r_tag, :r_title

  has_many :stops
  has_many :directions
end
