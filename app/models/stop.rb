class Stop < ActiveRecord::Base
  attr_accessible :r_tag, :s_tag, :s_title, :d_title

  belongs_to :route
  belongs_to :direction



end