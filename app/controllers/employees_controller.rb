class EmployeesController < ApplicationController
  def show
    @id = params[:id]

    @employee = Unirest.get("http://localhost:3000/api/v1/employees/#{@id}.json").body
  end
end
