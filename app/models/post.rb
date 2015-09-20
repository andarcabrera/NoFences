class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :category

  validates_presence_of :author_id, :title, :body

  def posted_date
    self.created_at.strftime("%m-%d-%y")
  end

end
