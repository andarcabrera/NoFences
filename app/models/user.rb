class User < ActiveRecord::Base
  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :posts, foreign_key: :author_id

  has_secure_password :validations => false


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.first_name = auth['info']['name'].split(" ")[0] || ""
         user.last_name = auth['info']['name'].split(" ")[1] || ""
         user.password_digest = ""
         user.email = auth['info']['email'] || "F"
      end
    end

  end

  validates_presence_of :first_name, :last_name, :email


end
