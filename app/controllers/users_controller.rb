class UsersController < ApplicationController
  def new
    @user = User.new
  end

   def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # flash[:success] = "Welcome to NoFences, #{@user.first_name}!"
      redirect_to categories_path
    else
      render "new"
      # append errors' full messages
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
