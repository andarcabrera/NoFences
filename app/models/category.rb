class Category < ActiveRecord::Base
  has_many :categorized_organizations
  has_many :organizations, through: :categorized_organizations
  has_many :posts

  validates_presence_of :name
end
