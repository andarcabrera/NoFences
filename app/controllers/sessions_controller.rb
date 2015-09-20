class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session]
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        redirect_to root_url
      else
        flash[:unsuccessful] = "Your email or password were entered incorrectly."
      end
    else
      auth = request.env["omniauth.auth"]
      user = User.where(:provider => auth['provider'],
                      :uid => auth['uid']).first || User.create_with_omniauth(auth)
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Signed in!"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end
end
