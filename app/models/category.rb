class Category < ActiveRecord::Base
  has_many :categorized_organizations
  has_many :organizations, through: :categorized_organizations
end
