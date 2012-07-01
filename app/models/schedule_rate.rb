class ScheduleRate < ActiveRecord::Base

  attr_accessible \
    :employee_id,
    :team_id,
    :card_rate,
    :cost_rate,
    :internal_rate,
    :until

end
