class RosterDate < ActiveRecord::Base

  MAXIMUM_SHIFTS = 3

  attr_accessible \
    :date,
    :employee_id,
    :locked,
    :rosters_attributes

  validates_uniqueness_of :date, scope: :employee_id

  belongs_to :employee

  has_many :rosters, :dependent => :destroy
 
  accepts_nested_attributes_for :rosters, allow_destroy: true, reject_if: proc { |attrs| attrs['project_id'].blank? }

  def build_shifts
    (MAXIMUM_SHIFTS - rosters.length).times { |shift| rosters.build shift: shift }
  end

  def duplicate(*date_strings)
    self.class.transaction do
      dates = date_strings.map { |date| Date.parse(date) }      
      RosterDate.destroy_all(date: dates, employee_id: self.employee_id, locked: false)
      dates.each do |date|
        dup_roster_date = self.dup
        dup_roster_date.date = date
        dup_roster_date.rosters << rosters.map(&:dup)
        dup_roster_date.save
      end
    end
  end

end
