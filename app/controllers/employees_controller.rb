class EmployeesController < ApplicationController
  def index
    @title = "Employee List"
    @employees = Employee.all(:order => "last_name, first_name")
    @nav_id = "all"
  end

  def new
    @title = "New Employee"
    @employee = Employee.new(:location_id => params[:location_id])
    if params[:location_id].nil?
      @nav_id = "admin"
    else
      @nav_id = params[:location_id].to_i
    end
  end

  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      flash[:success] = "Employee saved."
      redirect_to employees_path
    else
      render :new
      @title = "New Employee"
    end
  end

  def show
    @employee = Employee.find(params[:id])
    @title = @employee.name
    @nav_id = @employee.location_id
    @family_members = @employee.family_members
  end

  def edit
    @employee = Employee.find(params[:id])
    @title = "Edit " + @employee.name
    @nav_id = @employee.location_id
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(params[:employee])
      redirect_to :action => :show, :id => @employee.id
    else
      @title = "Edit " + @employee.name
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end
end
