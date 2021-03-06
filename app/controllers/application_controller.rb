class ApplicationController < ActionController::Base

  protect_from_forgery

  helper_method \
      :current_company,
      :current_user,
      :current_employee

  def current_user
    # TODO: From authlogic
    @current_user ||= current_employee.user
  end

  def current_employee
    # TODO From current_user
    @current_employee ||= begin
      if session[:current_employee_id].present?
        Employee.find(session[:current_employee_id])
      else
        employee = Employee.where('first_name ILIKE ?', 'hernus').limit(1).first
        session[:current_employee_id] = employee[:id]
        employee
      end
    end

  end

  def current_company
    @current_company ||= begin
      if session[:current_company_id].present?
        current_employee.companies.find(session[:current_company_id])
      else
        company = current_employee.companies.first
        session[:current_company_id] = company[:id]
        company
      end
    end
  end

protected

  def current_company=(company)
    if company
      session[:current_company_id] = company[:id]
      self.current_employee = company.employees.first
      @current_company = company
    else
      @current_company = session[:current_company_id] = self.current_employee = nil
    end
  end

  def current_employee=(employee)
    session[:current_employee_id] = employee ? employee[:id] : nil
    @current_employee = employee
  end

end
