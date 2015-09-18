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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password )
  end
end
