class Transit < ActiveRecord::Base
  attr_accessible :direction, :end_time, :line, :pause, :start_time, :stop, :walk_duration, :weekday, :weekend
end
