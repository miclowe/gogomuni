class Transit < ActiveRecord::Base
  attr_accessible :direction_id, :end_time, :route_id, :pause, :start_time, :stop_id, :walk_duration, :weekday, :weekend

  belongs_to :user
  belongs_to :route
  belongs_to :stop
  belongs_to :direction
end
