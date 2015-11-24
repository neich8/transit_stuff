class AddCtaKeyToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :cta_key, :string
  end
end
