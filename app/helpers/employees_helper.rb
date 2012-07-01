module EmployeesHelper
  def managers
    @managers ||= Employee.all
  end
end
