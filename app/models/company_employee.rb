class CompanyEmployee < ActiveRecord::Base
  
  attr_accessible \
      :company_id,
      :employee_id

  belongs_to :company
  belongs_to :employee

end
