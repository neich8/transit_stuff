require 'csv'
trains = [{key: "RED",   cta_key: 'Red',  name: "Red Line"  },
           {key: "BLUE", cta_key: 'Blue', name: "Blue Line" },
           {key: "G",    cta_key: 'G',    name: "Green Line"},
           {key: "BRN",  cta_key: 'Brn',  name: "Brown Line"},
           {key: "P",    cta_key: 'P',    name: "Purple Line"},
           {key: "Pexp", name: "Purple Express"},
           {key: "Y",    cta_key: 'Y',    name: "Yellow Line"},
           {key: "Pnk",  cta_key: 'Pink', name: "Pink Line"},
           {key: "O",    cta_key: 'Org',  name: "Orange Line"}
        ]

trains.each do |train|
  Train.create(train)
end

CSV.foreach('./db/train_stations.csv', :headers => true) do |station|
  location = station["Location"].split(", ")
  latitude = location.first.gsub("(", "")
  longitude = location.last.gsub(")", "")

  clean_station =   {
                      stop_id: station["STOP_ID"],
                      direction_id: station["DIRECTION_ID"],
                      stop_name: station["STOP_NAME"],
                      station_name: station["STATION_NAME"],
                      station_descriptive_name: station["STATION_DESCRIPTIVE_NAME"],
                      map_id: station["MAP_ID"],
                      latitude: latitude,
                      longitude: longitude
                    }
  new_station = Station.create(clean_station)
  Train.all.each{|train| train.stations << new_station if station[train.key] == "true"}
end
