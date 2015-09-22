class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :category
  has_many :chains
  validates_presence_of :author_id, :title, :body

  def posted_date
    self.created_at.strftime("%m-%d-%y")
  end

  def self.search(query)
    where("title ilike ? or body ilike ?", "%#{query}%", "%#{query}%")
  end

end
