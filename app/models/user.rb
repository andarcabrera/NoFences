class User < ActiveRecord::Base
  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :posts, foreign_key: :author_id

  has_secure_password :validations => false


  def self.create_with_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create
    user_info = user.facebook_email(auth)
    user.update(
        first_name: auth.info.name.split(" ")[0],
        last_name: auth.info.name.split(" ")[1],
        email: user_info["email"],
        password_digest: ""
      )
    user
  end

  def facebook_email(auth)
    token = auth['credentials']['token']
    @graph = Koala::Facebook::API.new(token)
    @graph.get_object("me?fields=email")
  end

  validates_presence_of :first_name, :last_name, :email


  def full_name
    self.first_name + " " + self.last_name
  end

end
