require "test_helper"

class OrderPlacementTest < ActiveSupport::TestCase
  test "order placement create will create order staches after saving" do
    order = create(:order)
    stache_1, stache_2, stache_3 = create_list(:stache, 3)
    cart = { stache_1.id.to_s => 3,
             stache_2.id.to_s => 5,
             stache_3.id.to_s => 2 }
    order_placement = OrderPlacement.new(order, cart)

    assert_equal 3, order_placement.create.count
  end
end
