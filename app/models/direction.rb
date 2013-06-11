class Direction < ActiveRecord::Base
  attr_accessible :d_title

  belongs_to :route
  has_many :stops
end
