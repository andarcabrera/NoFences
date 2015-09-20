class Category < ActiveRecord::Base
  has_many :categorized_organizations
  has_many :organizations, through: :categorized_organizations
  has_many :posts

  validates_presence_of :name

  def services_offered
  	self.posts.where(volunteer: true)
  end

  def services_wanted
  	self.posts.where(volunteer: nil)
  end 
end
