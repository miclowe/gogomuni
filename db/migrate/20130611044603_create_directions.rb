class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.string :d_title
      t.references :route

      t.timestamps
    end
    add_index :directions, :route_id
  end
end
