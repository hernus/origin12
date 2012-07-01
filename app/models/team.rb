class Team < ActiveRecord::Base

  attr_accessible \
    :deleted_at,
    :description,
    :key,
    :manager_id,
    :parent_id,
    :state

  alias_attribute :name, :description

  belongs_to :manager, class_name: 'Employee'

  has_one  :parent,   class_name: 'Team'
  has_many :children, class_name: 'Team'

  def state
    'active'
  end

  def destroy
    touch(:deleted_at)
  end

end
