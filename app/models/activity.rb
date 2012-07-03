class Activity < ActiveRecord::Base

  attr_accessible \
      :companyid,
      :default,
      :description,
      :display_order,
      :key

  def self.default
    where(default: true).limit(1).first
  end

end
