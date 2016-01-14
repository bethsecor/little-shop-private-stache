require "test_helper"

class StacheTest < ActiveSupport::TestCase
  test "quantity finds quantity requested in order_stache for stache" do
    order_stache = OrderStache.new(quantity: 3)
    stache = Stache.new
    stache.order_staches << order_stache

    assert_equal 3, stache.quantity
  end

  test "subtotal calculates cost of quantity requested of a stache" do
    order_stache = OrderStache.new(quantity: 3)
    stache = Stache.new(price: 5.0)
    stache.order_staches << order_stache

    assert_equal 15.0, stache.subtotal
  end
end
