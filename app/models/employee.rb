class Employee < ActiveRecord::Base

  attr_accessible \
    :key,
    :first_name,
    :last_name,
    :started_at,
    :terminated_at,
    :employee_rates_attributes

  has_many :employee_rates

  accepts_nested_attributes_for :employee_rates, reject_if: :all_blank

  def full_name
    [ self.first_name, self.last_name ].compact.join(' ')
  end

  def destroy
    touch(:deleted_at)
  end

end
