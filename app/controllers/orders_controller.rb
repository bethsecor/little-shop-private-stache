class OrdersController < ApplicationController
  before_action :check_current_user

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.new(order_params)
    @order_placement = OrderPlacement.new(@order, @cart.contents)
    if @order_placement.create
      flash[:order_notice] = "Order was successfully placed."
      session[:cart] = {}
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :address,
                                  :city, :state, :zipcode)
  end
end
