class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      login_redirect
    else
      flash[:error] = "Invalid username or password"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def login_redirect
    if session[:want_to_checkout]
      redirect_to new_order_path
    else
      redirect_to dashboard_path
    end
  end
end
