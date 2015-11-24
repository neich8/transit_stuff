class RoutesController < ApplicationController
  def index
    @trains = Train.all
    @stations = Station.uniques
  end

end
