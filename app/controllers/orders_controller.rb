class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @order = Order.joins(:staches).find(params[:id])
  end
end
