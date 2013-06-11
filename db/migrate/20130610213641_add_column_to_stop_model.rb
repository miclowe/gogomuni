class AddColumnToStopModel < ActiveRecord::Migration
  def change
    add_column :stops, :d_tag, :string
  end
end
