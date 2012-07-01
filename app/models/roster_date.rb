class RosterDate < ActiveRecord::Base

  attr_accessible \
    :date,
    :employee_id

  belongs_to :employee
  has_many   :rosters

end
