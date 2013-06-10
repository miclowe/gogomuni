class RenameandRemoveColumnsFromStopModel < ActiveRecord::Migration
  def up
    rename_column :stops, :stop_tag, :s_tag
    rename_column :stops, :stop_title, :s_title
    add_column :stops, :r_tag, :string
    rename_column :stops, :dir_tag, :d_tag
  end

  def down
  end
end
