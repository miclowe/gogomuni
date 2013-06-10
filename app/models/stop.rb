class Stop < ActiveRecord::Base
  attr_accessible :r_tag, :s_tag, :s_title

  has_many :stopdirections
  has_many :directions, :through => :stopdirection
  belongs_to :route, :foreign_key => :r_tag, :primary_key => :r_tag



end