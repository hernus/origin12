class Customer < ActiveRecord::Base

  attr_accessible \
      :key,
      :name

  belongs_to :company
  
  has_many   :projects

  alias_attribute :short_name,   :name
  alias_attribute :display_name, :name

  after_create :initialize_key

  scope :company, lambda { |company|
    where(company: company)
  }

  private

  def initialize_key
    if key.nil?
      update_attribute(:key, self.id)
    end
  end

end
