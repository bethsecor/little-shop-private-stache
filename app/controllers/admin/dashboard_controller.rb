class Admin::DashboardController < Admin::BaseController
  def show
    @orders = Order.all
    render "admin/dashboard"
  end
end
