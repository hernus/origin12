class Roster < ActiveRecord::Base

  attr_accessible \
      :roster_date,
      :project,
      :billing_probability

  alias_attribute :date, :roster_date

  belongs_to :project

  after_create :initialize_key

  private

  def initialize_key
    update_attribute(:key, self.id)
  end

end
