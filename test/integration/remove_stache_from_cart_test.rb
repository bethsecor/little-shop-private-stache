require "test_helper"

class RemoveStacheFromCartTest < ActionDispatch::IntegrationTest
  test "visitor add remove items from cart" do
    stache = create(:stache)
    visit staches_path
    click_on "Add to Cart"
    click_on "Add to Cart"
    click_on "View Cart"

    assert page.has_content?(stache.name)

    click_on "Remove From Cart"
    within(".cart") do
      refute page.has_content?(stache.name)
    end
    assert page.has_link?(stache.name)
    successfully_removed = "Successfully removed #{stache.name} from your cart."
    assert page.has_content?(successfully_removed)
  end
end
