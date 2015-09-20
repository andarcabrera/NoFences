class User < ActiveRecord::Base
  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :posts, foreign_key: :author_id

  has_secure_password :validations => false
  validate :facebook_password_check

  def self.create_with_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create
    user_info = user.facebook_email(auth)
    user.update(
        first_name: auth.info.name.split(" ")[0],
        last_name: auth.info.name.split(" ")[1],
        email: user_info["email"],
        password_digest: "",
      )
     p user
  end

  def facebook_email(auth)
    token = auth['credentials']['token']
    @graph = Koala::Facebook::API.new(token)
    @graph.get_object("me?fields=email")
  end


  def facebook_password_check
      if self.uid == nil && self.password == nil
        self.errors[:password] << 'needed!'
      end
  end

  validates_presence_of :first_name, :last_name, :email

  def full_name
    self.first_name + " " + self.last_name
  end

  def display_languages
    language_names = []
    self.languages.each do |language|
      language_names << language.name
    end
    language_names.join(", ")
  end

  def get_volunteer_posts
    @volunteer_posts = []
    self.posts.each do |post|
      @volunteer_posts << if post.volunteer
        end
      end
    @volunteer_posts
  end

  def count_volunteer_posts
    self.get_volunteer_posts.count
  end



end
