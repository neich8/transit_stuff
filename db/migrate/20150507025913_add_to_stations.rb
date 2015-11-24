class AddToStations < ActiveRecord::Migration
  def change
    add_column :stations, :stop_id, :string
    add_column :stations, :direction_id, :string
    add_column :stations, :stop_name, :string
    add_column :stations, :station_name, :string
    add_column :stations, :station_descriptive_name, :string
    add_column :stations, :map_id, :string
    add_column :stations, :longitude, :string
    add_column :stations, :latitude, :string
  end
end
