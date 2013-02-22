class LocationsController < ApplicationController
  def index
    @title = "Location List"
    @locations = Location.all
    @nav_id = "admin"
  end

  def new
    @title = "Add Location"
    @location = Location.new
    @nav_id = "admin"
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      flash[:success] = "Location added."
      redirect_to locations_path
    else
      @title = "Add Location"
      @nav_id = "admin"
      render :new
    end
  end

  def show
    @location = Location.find(params[:id])
    @employees = @location.employees.all(:order => "last_name, first_name")
    @title = @location.name
    @nav_id = @location.id
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "directory",
        :template => 'locations/show.pdf.html.erb',
        :show_as_html => params[:debug].present?,
      end
    end
  end

  def edit
    @location = Location.find(params[:id])
    @title = "Edit " + @location.name
    @nav_id = @location.id
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      flash[ :success ] = "Location updated."
      redirect_to locations_path
    else
      @title = "Edit Location"
      if @location.id.nil?
        @nav_id = "admin"
      else
        @nav_id = @location.id
      end
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    flash[ :success ] = "Location deleted."
    redirect_to locations_path
  end

end
