require "test_helper"

class AdjustQuantityInCartTest < ActionDispatch::IntegrationTest
  test "visitor adjusts quantity of a stache in cart" do
    stache = create(:stache)

    visit staches_path
    click_on "Add to Cart"
    click_on "View Cart"
    fill_in "Quantity", with: 3
    click_on "Update quantity"

    assert page.has_content? "3"
  end
end