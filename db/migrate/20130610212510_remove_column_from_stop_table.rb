class RemoveColumnFromStopTable < ActiveRecord::Migration
  def up
    remove_column :stops, :d_tag
  end

  def down
  end
end
