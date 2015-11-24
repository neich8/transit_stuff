class Station < ActiveRecord::Base
  has_many :stops
  has_many :trains, through: :stops

  scope :uniques, -> {
    select(:map_id).distinct.map{|s| 
      find_by(map_id: s.map_id)}
  }
end
