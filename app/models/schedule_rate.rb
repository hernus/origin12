class ScheduleRate < ActiveRecord::Base
  
  attr_accessible \
      :company_id,
      :customer_id,
      :employee_id,
      :project_id,
      :contract_rate,
      :state,
      :until

  belongs_to :employee
  belongs_to :project

end
