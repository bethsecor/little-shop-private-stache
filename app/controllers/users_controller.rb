class UsersController < ApplicationController
  helper :headshot
  before_action :current_user_guard, only: [:edit]

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
    @user = current_user
    @controller = self
  end

  def show_stache
    @photo = current_user.headshot_photos.last
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
