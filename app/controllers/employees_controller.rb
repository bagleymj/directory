class EmployeesController < ApplicationController
  def index
    @title = "Employee List"
    @employees = Employee.all
  end

  def new
    @title = "New Employee"
    @employee = Employee.new
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
    @title = @employee.first_name
  end

  def edit
    @employee = Employee.find(params[:id])
    @title = "Edit " + @employee.first_name
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(params[:employee])
      redirect_to employees_path
    else
      @title = "Edit " + @employee.first_name
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end
end
