require "test_helper"

class CannotCheckoutWithEmptyCartTest < ActionDispatch::IntegrationTest
  test "checkout button disabled when cart is empty" do
    visit cart_path
    click_on "Checkout"
    assert_equal cart_path, current_path
  end
end
