class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :r_tag
      t.string :r_title

      t.timestamps
    end
  end
end
