class Roster < ActiveRecord::Base

  attr_accessible \
      :roster_date,
      :customer_id,
      :project_id,
      :activity_id,
      :description,
      :hours,
      :shift

  belongs_to :roster
  belongs_to :customer
  belongs_to :project
  belongs_to :activity

  delegate :date, to: :roster

  after_create :initialize_key

  after_initialize :initialize_activity

  private

  def initialize_key
    update_attribute(:key, self.id)
  end

  def initialize_activity
    if new_record?
      self.activity = Activity.default
    end
  end

end
