class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
