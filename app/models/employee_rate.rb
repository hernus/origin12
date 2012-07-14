class EmployeeRate < ActiveRecord::Base

  attr_accessible \
    :employee_id,
    :team_id,
    :card_rate,
    :cost_rate,
    :internal_rate,
    :until

  def until_eternity?
    self.until == RateDate::ETERNITY_DATE
  end

end
