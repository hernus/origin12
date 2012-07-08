class RosterScheduleRate < ActiveRecord::Base

  attr_accessible \
      :roster_id,
      :schedule_rate

  belongs_to :roster
  belongs_to :schedule_rate
  
end
