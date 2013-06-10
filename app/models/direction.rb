class Direction < ActiveRecord::Base
  attr_accessible :d_tag, :d_title, :s_tag

  has_many :stopdirections
  has_many :stops, :through => :stopdirection
end
