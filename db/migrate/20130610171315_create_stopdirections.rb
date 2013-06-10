class CreateStopdirections < ActiveRecord::Migration
  def change
    create_table :stopdirections do |t|
      t.string :d_tag
      t.string :s_tag

      t.timestamps
    end
  end
end
