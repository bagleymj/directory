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
    @title = @employee.name
  end

  def edit
    @employee = Employee.find(params[:id])
    @title = "Edit " + @employee.name
  end

  def update
  end

  def destroy
  end
end
