class DropDirectionTable < ActiveRecord::Migration
  def up
    drop_table :directions
  end

  def down
  end
end
