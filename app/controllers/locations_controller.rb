class LocationsController < ApplicationController
  def index
    @title = "Location List"
    @locations = Location.all
    @nav_id = 31029
  end

  def new
    @title = "Add Location"
    @location = Location.new
    @nav_id = 31029
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
    @employees = @location.employees
    @title = @location.name
    @nav_id = @location.id
  end

  def edit
    @location = Location.find(params[:id])
    @title = "Edit " + @location.name
    @nav_id = @location.id
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
