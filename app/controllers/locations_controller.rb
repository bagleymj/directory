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

  def show
    @location = Location.find(params[:id])
    @title = @location.name
  end

  def edit
    @location = Location.find(params[:id])
    @title = "Edit " + @location.name
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      flash[ :success ] = "Section updated!"
      redirect_to locations_path
    else
      @title = "Edit " + @location.name
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    flash[ :success ] = "Location deleted"
    redirect_to locations_path
  end

end
