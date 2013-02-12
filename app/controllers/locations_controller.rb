class LocationsController < ApplicationController
  def index
    @title = "Location List"
    @locations = Location.all
  end

  def new
    @title = "Add Location"
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      redirect_to locations_path
    else
      render :new
    end
  end

end
