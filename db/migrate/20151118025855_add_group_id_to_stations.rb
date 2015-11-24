class AddGroupIdToStations < ActiveRecord::Migration
  def change
    add_column :stations, :group_id, :integer
  end
end
