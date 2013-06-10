class RemoveColumns < ActiveRecord::Migration
  def up
    remove_column :transits, :line
    remove_column :transits, :stop
    remove_column :transits, :direction
  end

  def down
  end
end
