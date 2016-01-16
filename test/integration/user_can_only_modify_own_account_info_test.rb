require "test_helper"

class UserCanOnlyModifyOwnAccountInfoTest < ActionDispatch::IntegrationTest
  test "user can modify own account info" do
    user = User.create(username: "user", password: "password")

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"

    click_on "Log In"

    assert_equal dashboard_path, current_path

    click_on "Edit Account Info"

    fill_in "Username", with: "updated_username"
    fill_in "Password", with: "new_password"
    fill_in "Password confirmation", with: "new_password"
    click_on "Update Account"

    click_on "Logout"

    click_on "Login"

    fill_in "Username", with: "updated_username"
    fill_in "Password", with: "new_password"

    click_on "Log In"

    assert page.has_content?("Logged In As: #{User.last.username}")
  end
end
