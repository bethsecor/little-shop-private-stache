class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
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
end
