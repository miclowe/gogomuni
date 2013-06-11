class AddColumnsToTransit < ActiveRecord::Migration
  def change
    add_column :transits, :route_id, :integer
    add_column :transits, :stop_id, :integer
    add_column :transits, :direction_id, :integer
  end
end
