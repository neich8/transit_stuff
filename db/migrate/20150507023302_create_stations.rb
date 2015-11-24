class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name, :cta_id
      t.string :direction
      t.timestamps
    end
  end
end
