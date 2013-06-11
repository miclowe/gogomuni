class Transit < ActiveRecord::Base
  attr_accessible :direction, :end_time, :route, :pause, :start_time, :stop, :walk_duration, :weekday, :weekend

  belongs_to :user
  belongs_to :route
  belongs_to :stop
  belongs_to :direction
end
