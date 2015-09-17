class Organization < ActiveRecord::Base
  has_many :categorized_organizations
  has_many :categories, through: :categorized_organizations
end
