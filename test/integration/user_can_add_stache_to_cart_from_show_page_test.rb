require 'test_helper'

class UserCanAddStacheToCartFromShowPageTest < ActionDispatch::IntegrationTest
  test "user can add stache to cart" do
    stache = create(:stache)

    visit stache_path(stache)
    click_on("Add to Cart")
    
    assert_equal cart_path, current_path
    assert page.has_content?(stache.name)
    assert page.has_content?("Total Price:")
  end
end
