class CartStachesController < ApplicationController
  def create
    stache = Stache.find(params[:stache_id])
    @cart.add_stache(stache.id)
    session[:cart] = @cart.contents
    redirect_back_or staches_path
  end
end
