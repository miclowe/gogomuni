class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.string :d_tag
      t.string :d_title

      t.timestamps
    end
  end
end
