class EmployeesController < ApplicationController
  def show
    @id = params[:id]

    @employee = Unirest.get("http://localhost:3000/api/v1/employees/#{@id}.json").body
  end

  def index
    @employees = Unirest.get("http://localhost:3000/api/v1/employees.json").body
  end

  def new
  end

  def create
    @employee = Unirest.post("http://localhost:3000/api/v1/employees",
        :headers => { "Accept" => "application/json" },
        :parameters => { :name => params[:name],
            :email => params[:email],
            :birthdate => params[:birthdate],
            :ssn => params[:ssn]
        }
      ).body

    redirect_to "/employees/#{@employee['id']}"
  end


  def edit
    @employee_id = params[:id]
    @employee = Unirest.get("http://localhost:3000/api/v1/employees/#{@employee_id}.json").body
  end

  def update
    @employee = Unirest.patch("http://localhost:3000/api/v1/employees/#{params[:id]}",
        :headers => { "Accept" => "application/json" },
        :parameters => { :name => params[:name],
            :email => params[:email],
            :birthdate => params[:birthdate],
            :ssn => params[:ssn]
        }
      ).body

    redirect_to "/employees/#{@employee['id']}"
  end

  def destroy
    Unirest.delete("http://localhost:3000/api/v1/employees/#{params[:id]}", 
      :headers => { "Accept" => "application/json" })

    redirect_to "/employees"
  end




end
