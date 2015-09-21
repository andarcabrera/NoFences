class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if request.xhr?
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_url
      else
        render :status => 400
      end
    else
        render "new"
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    @user = User.find_by_id(params[:id])
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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :photo)
  end
end
