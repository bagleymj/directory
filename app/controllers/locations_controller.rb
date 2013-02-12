class LocationsController < ApplicationController
  def index
    @title = "Location List"
  end
  def new
    @title = "Add Location"
    @location = Location.new
  end

end
