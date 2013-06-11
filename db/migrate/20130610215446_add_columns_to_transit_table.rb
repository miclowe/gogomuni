class AddColumnsToTransitTable < ActiveRecord::Migration
  def change
    add_column :transits, :route, :string
    add_column :transits, :stop, :string
    add_column :transits, :direction, :string
  end
end
