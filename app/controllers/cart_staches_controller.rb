class CartStachesController < ApplicationController
  def create
    stache = Stache.find(params[:stache_id])
    @cart.add_stache(stache.id)
    session[:cart] = @cart.contents
    if session[:forwarding_url] == stache_path(stache)
      redirect_to cart_path
    else
      redirect_back_or staches_path
    end
  end

  def destroy
    stache = Stache.find(params[:id])
    @cart.delete_stache(stache.id)
    session[:cart] = @cart.contents
    stache_link = view_context.link_to stache.name, stache_path(stache)
    flash.now[:removed] =
    "Successfully removed #{stache_link} from your cart.".html_safe
    render "carts/show"
  end

  def update_quantity
    stache_id = update_params[:stache_id]
    quantity = update_params[:quantity]
    session[:cart][stache_id] = quantity.to_f
    redirect_to cart_path
  end

  private

  def update_params
    params.require(:stache_in_cart).permit(:quantity, :stache_id)
  end
end
