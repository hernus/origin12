class RosterDate < ActiveRecord::Base

  MAXIMUM_SHIFTS = 3

  attr_accessible \
    :date,
    :employee_id,
    :locked,
    :rosters_attributes

  validates_uniqueness_of :date, scope: :employee_id

  scope :week, lambda { |date|
    where(date: date.beginning_of_week(:sunday)..(date.end_of_week(:saturday) + 1.day))
  }

  scope :wdays, lambda { |wdays|
    where([ '((weekday(`date`) + 1) % 7) in (?)', wdays])
  }

  scope :employee, lambda { |employee_id|
    where(employee_id: employee_id)
  }

  scope :unlocked, where(locked: false)

  belongs_to :employee

  has_many :rosters, :dependent => :destroy
 
  accepts_nested_attributes_for :rosters, allow_destroy: true, reject_if: proc { |attrs| attrs['project_id'].blank? }

  def build_shifts
    (MAXIMUM_SHIFTS - rosters.length).times { |shift| rosters.build shift: shift }
  end

  def self.duplicate(params, employee)
    transaction do
      date = Date.parse(params[:date])
      params[:weeks] &&= params[:weeks].to_i
      self.week(date).wdays(params[:wday]).employee(employee[:id]).each do |roster_date|
        roster_date.duplicate(*future_dates(roster_date, params[:weeks]))
      end
    end
  end

  # Duplicate roster_date for new dates provided
  # either as strings (yyyy-mm-dd) or date objects.
  def duplicate(*dates)
    self.class.transaction do
      map_date_strings_to_dates! dates
      RosterDate.destroy_all(date: dates, employee_id: self.employee_id, locked: false)
      dates.each do |date|
        dup_roster_date = self.dup
        dup_roster_date.date = date
        dup_roster_date.rosters << rosters.map(&:dup)
        dup_roster_date.save
      end
    end
  end

private

  def map_date_strings_to_dates!(dates)
    dates.map! do |date|
      date.is_a?(String) ? Date.parse(date) : date
    end
  end

  def self.future_dates(roster_date, weeks)
    ([ roster_date ] * weeks.abs).each_with_index.map do |roster_date, week_ordinal|
      roster_date.date + (week_ordinal + 1).weeks
    end
  end

end
