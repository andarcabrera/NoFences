class SessionsController < ApplicationController
  def new
  end

  def create
    # if params[:session]
    #   user = User.find_by(email: params[:session][:email])
    #   if user && user.authenticate(params[:session][:password])
    #     log_in(user)
    #     redirect_to root_url
    #   else
    #     flash[:unsuccessful] = "Your email or password were entered incorrectly."
    #   end
    # else
    #   auth = request.env["omniauth.auth"]
    #   user = User.where(:provider => auth['provider'],
    #                   :uid => auth['uid']).first || User.create_with_omniauth(auth)
    #   session[:user_id] = user.id
    #   redirect_to root_url, :notice => "Signed in!"
    # end

    if params[:session] == nil
      auth = request.env["omniauth.auth"]
       user = User.where(:provider => auth['provider'],
                       :uid => auth['uid']).first || User.create_with_omniauth(auth)
       session[:user_id] = user.id
       redirect_to root_url, :notice => "Signed in!"
  else
    user = User.find_by(email: params[:session][:email])
    if request.xhr?

      if user && user.authenticate(params[:session][:password])
        log_in(user)
        p "success" * 100
        redirect_to root_url
      else
        p "failure" * 100
      end
    else
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        redirect_to root_url
      else
        redirect_to root_url
        flash[:unsuccessful] = "Your email or password were entered incorrectly."
      end
    end
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
