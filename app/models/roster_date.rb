class RosterDate < ActiveRecord::Base

  MAXIMUM_SHIFTS = 3

  attr_accessible \
    :date,
    :employee_id,
    :locked,
    :rosters_attributes

  validates_uniqueness_of :date, scope: :employee_id

  belongs_to :employee

  has_many :rosters
 
  accepts_nested_attributes_for :rosters, allow_destroy: true, reject_if: proc { |attrs| attrs['project_id'].blank? }

  def build_shifts
    (MAXIMUM_SHIFTS - rosters.length).times { |shift| rosters.build shift: shift }
  end

end
