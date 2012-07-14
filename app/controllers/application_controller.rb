class ApplicationController < ActionController::Base

  protect_from_forgery

  helper_method \
      :current_company,
      :current_user,
      :current_employee

  def current_user
    @current_user ||= current_employee.user # User....(include: :employee)
  end

  def current_employee
    @current_employee ||= Employee.find_by_first_name('hernus') # current_user.employee
  end

  def current_company
    @current_company ||= begin
      if session[:current_company_id].present?
        current_employee.companies.find(session[:current_company_id])
      else
        company = current_employee.company
        session[:current_company_id] = company[:id]
        company
      end
    end
  end

protected

  def current_company=(company)
    session[:current_company_id] = company[:id]
    @current_company = company
  end

end
