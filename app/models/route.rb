class Route < ActiveRecord::Base
  attr_accessible :r_tag, :r_title

  has_many :stops, :foreign_key => :r_tag, :primary_key => :r_tag
end
