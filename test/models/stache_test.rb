require "test_helper"

class StacheTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
  should validate_presence_of(:description)
  should validate_presence_of(:price)
  should validate_numericality_of(:price).is_greater_than_or_equal_to(0.0)
  should validate_presence_of(:categories)

  test "it sets a default image if none is given" do
    stache = create(:stache, image_url: nil)
    default_image = "http://i.imgur.com/kMx8J0g.png"
    assert_equal default_image, stache.image_url
  end

  test "it returns corrrect status" do
    stache1 = create(:stache, retired: true)
    stache2 = create(:stache, retired: false)

    assert_equal "Retired", stache1.status
    assert_equal "Active", stache2.status
  end

  test "it truncates the stache description on the index pages" do
    stache1 = create(:stache, retired: false, description: "a" * 300)

    assert_equal 234, stache1.truncated_description.length
  end
end
