class Admin::DashboardController < Admin::BaseController
  def show
    render "admin/dashboard"
  end
end
