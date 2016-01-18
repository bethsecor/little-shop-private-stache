class Admin::OrdersController < ApplicationController
  def paid
    Order.update(params[:order_id], status: "paid")
    redirect_to admin_dashboard_path
  end

  def complete
    Order.update(params[:order_id], status: "completed")
    redirect_to admin_dashboard_path
  end

  def cancel
    Order.update(params[:order_id], status: "cancelled")
    redirect_to admin_dashboard_path
  end

  def show
    @order = Order.find(params[:id])
  end
end
