class ScheduleRate < ActiveRecord::Base
  
  attr_writer :back_rate

  attr_accessible \
      :company_id,
      :customer_id,
      :employee_id,
      :project_id,
      :contract_rate,
      :state,
      :until,
      :back_rate

  belongs_to :employee
  belongs_to :project

  scope :employee, lambda { |employee_id|
    where(:employee_id => employee_id)
  }

  scope :chronological, lambda {
    eternity = RosterDate::ETERNITY_DATE.to_s(:db)
    order("coalesce(`until`, '#{eternity}') ASC")
  }

  scope :date, lambda { |date|
    where([ "`until` >= ?", date ]).chronological.limit(1)
  }


  after_save :update_back_rate

private

  def update_back_rate
    if @back_rate
      schedule_rate = project.schedule_rates.employee(employee).find(@back_rate.delete(:id))
      schedule_rate.update_attributes(@back_rate)
    end
  end

end
