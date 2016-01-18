class Admin::DashboardController < Admin::BaseController
  def show
    if params[:status]
      @orders = Order.where(status: params[:status])
    else
      @orders = Order.all
    end
    render "admin/dashboard"
  end
end
