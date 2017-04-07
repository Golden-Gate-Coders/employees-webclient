class Employee
  attr_accessor :id, :name, :email, :birthdate, :ssn

  # Employee.new(name: "Danish", email: "")
  def initialize(employee_params)
    @id = employee_params["id"]
    @name = employee_params["name"]
    @email = employee_params["email"]
    @birthdate = employee_params["birthdate"]
    @ssn = employee_params["ssn"]
  end

  # Instance Method
  # @employee.allcaps_name
  def allcaps_name
    @name.upcase
  end

  # Class Method
  # Employee.find
  def self.find(id)
    # Get 
    employee_hash = Unirest.get("http://localhost:3000/api/v1/employees/#{id}.json").body
    # Should return an employee with id 'id'
    Employee.new(employee_hash)
  end

end