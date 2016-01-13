class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception
  before_action :set_cart
  before_action :store_location

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def redirect_back_or(default = staches_path)
    redirect_to session[:forwarding_url] || default
    session.delete(:forwarding_url)
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
