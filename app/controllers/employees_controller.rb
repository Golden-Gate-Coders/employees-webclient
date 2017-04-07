class EmployeesController < ApplicationController

  def show
    @id = params[:id]
    @employee = Employee.find(@id)
  end

  def index
    @employees = Employee.all
  end

  def new
  end

  def create
    # @employee = Employee.create(params)
    @employee = Employee.create(params[:name], params[:email], params[:birthdate], params[:ssn])
    redirect_to "/employees/#{@employee['id']}"
  end


  def edit
    @employee_id = params[:id]
    @employee = Employee.find(@employee_id)
  end

  def update
    @employee = Employee.update(params[:id], params[:name], params[:email], params[:birthdate], params[:ssn])

    redirect_to "/employees/#{@employee['id']}"
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to "/employees"
  end

end
