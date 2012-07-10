class Roster < ActiveRecord::Base

  attr_accessible \
      :customer_id,
      :project_id,
      :roster_date,
      :activity_id,
      :description,
      :hours,
      :shift

  belongs_to :company
  belongs_to :customer
  belongs_to :project
  belongs_to :roster_date
  belongs_to :activity

  has_one :employee, through: :roster_date

  delegate :date, to: :roster_date

  validates_presence_of :project_id

  def schedule_rate
    # schedule_rates.
    #     where('`until` >= ?', date.to_s(:db)).
    #     order('`until` ASC').
    #     limit(1).
    #     first
  end

  after_create :initialize_key

  after_initialize :initialize_new_record

  # def dup
  #   roster = super
  #   roster_schedule_rates.each do |roster_schedule_rate|
  #     roster.roster_schedule_rates << roster_schedule_rate.dup
  #   end
  #   roster
  # end

private

  def initialize_key
    update_attribute(:key, self.id)
  end

  def initialize_new_record
    if new_record?
      self.activity = Activity.default
    end
  end

end
