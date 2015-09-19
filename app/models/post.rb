class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :category

  validates_presence_of :author_id, :title, :body



end
