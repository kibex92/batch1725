require_relative "app/repositories/employee_repository"

employee_repository = EmployeeRepository.new(File.join(__dir__, "data/employees.csv"))
p employee_repository.all