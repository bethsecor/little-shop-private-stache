require "test_helper"

class AddStachesToCartTest < ActionDispatch::IntegrationTest
  test "visitor add items to cart and views cart" do
    stache = create(:stache)
    visit staches_path

    click_on "Add to Cart"
    click_on "Add to Cart"
    click_on "View Cart"

    assert_equal current_path, cart_path
    assert page.has_selector?("img[src$='#{stache.image_url}']")
    assert page.has_content?(stache.name)
    assert page.has_content?(stache.description)
    assert page.has_content?(stache.price)
    assert page.has_content?("Total Price: #{stache.price * 2}")
  end
end
