module RoutesHelper
  def trains_class station
    station.trains.map{|trains| trains.id }.join(" ")
  end

end
