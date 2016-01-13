require "test_helper"

class RegisteredUserCanLogInTest < ActionDispatch::IntegrationTest
  test "a registered user can login" do
    User.create(username: "Carl", password: "password")
    visit login_path
    fill_in "Username", with: "Carl"
    fill_in "Password", with: "password"
    click_on "Log In"

    assert_equal dashboard_path, current_path
    assert page.has_content?("Logged In As: Carl")
  end
end
