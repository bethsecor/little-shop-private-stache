class CartStachesController < ApplicationController
  def create
    stache = Stache.find(params[:stache_id])
    @cart.add_stache(stache.id)
    session[:cart] = @cart.contents
    redirect_back_or staches_path
  end

  def destroy
    stache = Stache.find(params[:id])
    @cart.delete_stache(stache.id)
    session[:cart] = @cart.contents
    redirect_to cart_path
  end
end
