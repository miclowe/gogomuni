class AddColumnUserToTransit < ActiveRecord::Migration
  def change
    add_column :transits, :user_id, :integer
  end
end
