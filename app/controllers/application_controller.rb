class ApplicationController < ActionController::Base

  protect_from_forgery

  def current_company
    @current_company ||= Company.find_by_name('origin12')
  end

end
