class Customer < ActiveRecord::Base

  attr_accessible :name

  has_many :projects

  alias_attribute :display_name, :name

  after_create :initialize_key

  private

  def initialize_key
    update_attribute(:key, self.id)
  end

end
