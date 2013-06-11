class AddColumnsToStop < ActiveRecord::Migration
  def change
    add_column :stops, :route_id, :integer
    add_column :stops, :direction_id, :integer
  end
end
