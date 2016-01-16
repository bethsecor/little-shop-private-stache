require "test_helper"

class VisitorChecksOutTest < ActionDispatch::IntegrationTest
  test "visitor checks out" do
    create(:stache)
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

    assert_equal new_order_path, current_path

    fill_in "First Name", with: "Beth"
    fill_in "Last Name", with: "Secor"
    fill_in "Address", with: "1510 Blake St."
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zipcode", with: "80120"
    click_on "Submit Order"

    order = Order.last
    assert_equal current_path, order_path(order)

    assert page.has_content?("Order was successfully placed")
    assert page.has_content?(order.id)
  end
end
