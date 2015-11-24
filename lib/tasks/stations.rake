

namespace :stations do

  task :build_uniques => :environment do
    station_groups = {}
    Station.all.each do |station|
      station_group = station_groups[station.station_name]
      if station_group.is_a? Array
        station_group << station.id
      else
        station_groups[station.station_name] = [station.id]
      end
    end
    i = 1
    station_groups.each do |k, v|
      station_groups[k].each do |id|
        station = Station.find(id)
        station.group_id = i
        station.save
        puts "added group_id: #{i} to #{station.station_name}"
      end
      i += 1
    end
  end

end