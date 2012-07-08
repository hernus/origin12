class Roster < ActiveRecord::Base

  attr_accessible \
      :roster_date,
      :customer_id,
      :activity_id,
      :project_id,
      :description,
      :hours,
      :shift,
      :schedule_rates_attributes

  belongs_to :roster_date

  belongs_to :customer

  belongs_to :project

  belongs_to :activity

  has_one :employee, through: :roster_date

  has_many :roster_schedule_rates

  has_many :schedule_rates, through: :roster_schedule_rates

  delegate :date, to: :roster_date

  validates_presence_of :project_id

  def schedule_rate
    schedule_rates.
        where('`until` >= ?', date.to_s(:db)).
        order('`until` ASC').
        limit(1).
        first
  end

  accepts_nested_attributes_for :schedule_rates,
      allow_destroy: true,
      reject_if: proc { |attrs| attrs['contract_rate'].blank? }

  def schedule_rates_attributes_with_project=(attributes)
    attributes.each do |index, attributes|
      attributes.merge! project_id: project_id
    end
    self.schedule_rates_attributes_without_project = attributes
  end

  alias \
      :schedule_rates_attributes_without_project= \
      :schedule_rates_attributes=

  alias \
      :schedule_rates_attributes= \
      :schedule_rates_attributes_with_project=

  after_create :initialize_key

  after_initialize :initialize_new_record

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
