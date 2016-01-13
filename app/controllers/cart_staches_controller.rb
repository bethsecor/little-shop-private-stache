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
    stache_link = view_context.link_to stache.name, stache_path(stache)
    flash[:removed] =
    "Successfully removed #{stache_link} from your cart.".html_safe
    redirect_to cart_path
  end
end
