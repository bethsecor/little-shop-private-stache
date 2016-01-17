require "test_helper"

class AdminCreatesItemTest < ActionDispatch::IntegrationTest
  test "admin can create a stache" do
    admin = create(:admin)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_path
    click_on "Create New Stache"

    assert_equal new_admin_stache_path, current_path

  
  end
end