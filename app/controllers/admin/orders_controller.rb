class Admin::OrdersController < ApplicationController
  def paid
    Order.update(params[:order_id], status: "paid")
    redirect_to admin_dashboard_path
  end
end
