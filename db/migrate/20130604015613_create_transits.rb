class CreateTransits < ActiveRecord::Migration
  def change
    create_table :transits do |t|
      t.string :line
      t.string :stop
      t.string :direction
      t.time :start_time
      t.time :end_time
      t.integer :walk_duration
      t.boolean :weekday
      t.boolean :weekend
      t.boolean :pause

      t.timestamps
    end
  end
end
