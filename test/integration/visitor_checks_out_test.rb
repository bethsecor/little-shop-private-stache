require "test_helper"

class VisitorChecksOutTest < ActionDispatch::IntegrationTest
  test "visitor checks out" do
    stache = create(:stache)
    user = create(:user, password: "pass")

    visit staches_path
    click_on "Add to Cart"
    click_on "Add to Cart"
    visit cart_path
    click_on "Checkout"

    assert_equal login_path, current_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "pass"
    click_on "Log In"
    visit cart_path
    click_on "Checkout"
    order = Order.last

    assert_equal current_path, orders_path
    assert page.has_content?("Order was successfully placed")
    assert page.has_content?(order.id)
  end
end