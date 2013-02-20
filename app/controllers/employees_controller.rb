class EmployeesController < ApplicationController
  def index
    @title = "Employee List"
    @employees = Employee.all(:order => "last_name, first_name")
    @nav_id = 31088
  end

  def new
    @title = "New Employee"
    @employee = Employee.new(:location_id => params[:location_id])
    @nav_id = 31029
  end

  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      redirect_to employees_path
    else
      render :new
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
      redirect_to employees_path
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
