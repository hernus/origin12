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

  scope :employee, lambda { |employee_id|
    where(:employee_id => employee_id)
  }

  scope :date, lambda { |date|
    where([ "`until` >= ?", date ]).order('`until` ASC').limit(1)
  }

end
