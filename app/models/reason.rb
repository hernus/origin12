class Reason < ActiveRecord::Base

  attr_accessible \
      :background_color,
      :color,
      :company,
      :description

  after_create :initialize_key

  private

  def initialize_key
    update_attribute(:key, self.id)
  end

end
