class Company < ActiveRecord::Base

  attr_accessible \
      :key,
      :name

  has_many :customers
  has_many :projects

end
