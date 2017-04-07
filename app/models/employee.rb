class Employee
  attr_accessor :name, :email, :birthdate, :ssn

  # Employee.new(name: "Danish", email: "")
  def initialize(employee_params)
    @name = employee_params["name"]
    @email = employee_params["email"]
    @birthdate = employee_params["birthdate"]
    @ssn = employee_params["ssn"]
  end

  def allcaps_name
    @name.upcase
  end
end