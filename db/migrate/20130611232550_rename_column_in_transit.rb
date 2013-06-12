class RenameColumnInTransit < ActiveRecord::Migration
  def up
    rename_column :transits, :walk_duration, :buffer
  end

  def down
  end
end
