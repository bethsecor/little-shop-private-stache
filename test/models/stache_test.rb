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
end
