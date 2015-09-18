class User < ActiveRecord::Base
  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :posts, foreign_key: :author_id

  validates_presence_of :first_name, :last_name, :email, :password_digest

end
