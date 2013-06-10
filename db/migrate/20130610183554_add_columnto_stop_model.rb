class AddColumntoStopModel < ActiveRecord::Migration
  def up
    add_column :stops, :d_title, :string
  end

  def down
  end
end
