class Project < ActiveRecord::Base

  attr_accessible :description, :title

  has_many :rosters

  after_create :initialize_key

  private

  def initialize_key
    update_attribute(:key, self.id)
  end

end
