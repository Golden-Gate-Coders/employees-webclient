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


  # Employee.all
  def self.all
    employees_api_array = Unirest.get("http://localhost:3000/api/v1/employees.json").body

    employees = []
    employees_api_array.each do |employee_hash|
      employees << Employee.new(employee_hash)
    end

    return employees
  end

  # Employee.create
  def self.create(name, email, birthdate, ssn)
    employee = Unirest.post("http://localhost:3000/api/v1/employees",
        :headers => { "Accept" => "application/json" },
        :parameters => { :name => name,
            :email => email,
            :birthdate => birthdate,
            :ssn => ssn
        }
      ).body
    return employee
  end

  # Employee.update
  def self.update(id, name, email, birthdate, ssn)
    employee = Unirest.patch("http://localhost:3000/api/v1/employees/#{id}",
        :headers => { "Accept" => "application/json" },
        :parameters => { :name => name,
            :email => email,
            :birthdate => birthdate,
            :ssn => ssn
        }
      ).body
    return employee
  end

  def destroy
    Unirest.delete("http://localhost:3000/api/v1/employees/#{id}", 
      :headers => { "Accept" => "application/json" })
  end


end