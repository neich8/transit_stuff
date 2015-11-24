class CreateTrainsStations < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.belongs_to :train
      t.belongs_to :station
      t.timestamps
    end
  end
end
