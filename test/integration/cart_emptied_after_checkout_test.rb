require "test_helper"

class CartEmptiedAfterCheckoutTest < ActionDispatch::IntegrationTest
  test "customers cart is emptied after checkout" do
    stache = create(:stache)
    user = create(:user, password: "pass")
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit staches_path
    click_on "Add to Cart"
    click_on "Add to Cart"
    visit cart_path
    click_on "Checkout"

    assert_equal new_order_path, current_path

    fill_in "First Name", with: "Beth"
    fill_in "Last Name", with: "Secor"
    fill_in "Address", with: "1510 Blake St."
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zipcode", with: "80120"
    click_on "Submit Order"

    within ".cart_total" do
      assert page.has_content?("0")
    end

    click_on "View Cart"

    refute page.has_content?(stache.name)
  end
end
