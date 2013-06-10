class Stopdirection < ActiveRecord::Base
  attr_accessible :d_tag, :s_tag

  belongs_to :direction
  belongs_to :stop
end
