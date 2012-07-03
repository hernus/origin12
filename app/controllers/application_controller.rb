class ApplicationController < ActionController::Base

  protect_from_forgery

  helper_method \
      :current_company,
      :current_user,
      :current_employee

  def current_company
    @current_company ||= Company.find_by_name('origin12')
  end

  def current_user
    @current_user ||= User.last(include: :employee)
  end

  def current_employee
    @current_employee ||= current_user.employee
  end

end
