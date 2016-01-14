class UsersController < ApplicationController
  helper :headshot

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    @user = current_user
    render :dashboard
  end

  def mustache_me

  end

  def show_stache
    sleep(1.5)
    @photo = HeadshotPhoto.last
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
