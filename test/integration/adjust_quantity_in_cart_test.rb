require "test_helper"

class AdjustQuantityInCartTest < ActionDispatch::IntegrationTest
  test "visitor adjusts quantity of a stache in cart" do
    create(:stache)

    visit staches_path
    click_on "Add to Cart"
    click_on "View Cart"
    fill_in "Quantity", with: 3
    click_on "Update"

    assert page.has_content? "3"
    refute page.has_content? "3.0"
  end
end
