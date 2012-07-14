class Project < ActiveRecord::Base

  attr_accessible \
      :description,
      :manager_id,
      :parent_id,
      :name,
      :short_name,
      :start_date,
      :end_date,
      :budget_days,
      :budget_amount

  alias_attribute :display_name, :name

  belongs_to :customer
  belongs_to :manager, class_name: 'Employee'

  has_many :rosters
  has_many :schedule_rates

  acts_as_tree order: 'name'

  after_create :initialize_key

  def as_json(opts = {})
    super only: [ :id, :key, :name ]
  end

  private

  def initialize_key
    if key.nil?
      update_attribute(:key, self.id)
    end
  end

end
