class User < ActiveRecord::Base
  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :posts, foreign_key: :author_id
  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id
  has_many :received_messages, class_name: "Message", foreign_key: :receiver_id

  has_secure_password :validations => false
  validate :facebook_password_check

  mount_uploader :photo, PhotoUploader

  # attr_accessible :photo, :photo_cache, :remove_photo

  def self.create_with_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create
    user_info = user.facebook_email(auth)
    user.update(
        first_name: auth.info.name.split(" ")[0],
        last_name: auth.info.name.split(" ")[1],
        email: user_info["email"] ||= "no email provided",
        password_digest: "",
      )
  end

  def password
    @password ||= self.password_digest && BCrypt::Password.new(self.password_digest)
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

  def update_known_languages(language_array)
    language_array.each do |new_language|
      possible_new = Language.find_by(name: new_language)
      unless self.languages.include?(possible_new)
        self.languages << possible_new
      end
    end
  end

  def get_new_languages(language_params)
    languages = []
    language_params.each do |array|
        if array.include?("on")
          languages << array[0]
        end
      end
      languages
  end

  def valid_edit_form?(params)
    params[:user][:first_name] != "" && params[:user][:last_name] != "" && params[:user][:email] != ""
  end

  def known_language?(language_name)
    unless self.languages.empty?
      self.languages.each do |language|
        if language_name == language.name
          return true
        end
      end
    end
  end

  def messages
    Message.all.where("(sender_id = ? or receiver_id = ?)", self.id, self.id)
  end

  def chains
    user_chains = []
    self.messages.each do |message|
      unless user_chains.include?(message.chain)
        user_chains << message.chain
      end
    end
    if user_chains == [nil]
      return []
    else
      return user_chains
    end
  end

  def already_messaged?(post)
    self.chains.each do |chain|
      if chain.post_id == post.id
        return true
      end
    end
    false
  end




end



