class Transit < ActiveRecord::Base
  attr_accessible :direction, :end_time, :route, :pause, :start_time, :stop, :walk_duration, :weekday, :weekend

  belongs_to :user
end
