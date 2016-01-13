require "test_helper"

class CartClearsOnLogoutTest < ActionDispatch::IntegrationTest
  test "the cart clears when the user logs out" do
    User.create(username: "Carl", password: "password")
    create(:stache)

    visit login_path
    fill_in "Username", with: "Carl"
    fill_in "Password", with: "password"
    click_on "Log In"

    visit staches_path
    click_on "Add to Cart"

    assert page.has_content?("View Cart(1)")
    click_on "Logout"

    assert page.has_content?("View Cart(0)")
  end
end
