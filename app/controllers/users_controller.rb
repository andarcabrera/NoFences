class UsersController < ApplicationController
  def new
    @user = User.new
    if request.xhr?
      render partial: "layouts/register", locals: { user: @user }
    end
  end

  def create
    @user = User.new(user_params)
    p user_params
    if request.xhr?
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_url
      else
        render :status => 400
      end
    else
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_url
      else
        render :status => 400
      end
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if request.xhr?

      if params[:photo]
        p params[:photo]
        @user.update_attributes(photo: params[:photo])
      elsif @user.valid_edit_form?(params)
        p params
        @user.update_attributes(user_params)
        puts @user.errors.full_messages
        if params[:language]
          @user.update_known_languages(@user.get_new_languages(params[:language]))
        end
      else
        render :status => 400
      end
    end
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

  def update_user_params
    params[:user].delete(:password) if params[:user][:password].blank?
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
