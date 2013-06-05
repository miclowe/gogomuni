class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :dir_tag
      t.string :dir_title
      t.string :stop_tag
      t.string :stop_title

      t.timestamps
    end
  end
end
