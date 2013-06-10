class DropStopdirectionandStopDirectionTable < ActiveRecord::Migration
  def up
    drop_table :stop_directions
    drop_table :stopdirections
  end

  def down
  end
end
