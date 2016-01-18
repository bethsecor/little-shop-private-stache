require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "formats a created date" do
    date = DateTime.new(2002, 10, 31, 2, 2, 2, "+02:00")
    order = Order.create(created_at: date)

    assert_equal "10/30/2002 at 05:02 PM", order.formatted_created_date
  end

  test "formats a updated date" do
    date = DateTime.new(2002, 10, 31, 2, 2, 2, "+02:00")
    order = Order.create(updated_at: date)

    assert_equal "10/30/2002 at 05:02 PM", order.formatted_updated_date
  end

  test "order completed" do
    order = Order.new(status: "completed")
    assert_equal "Yes", order.completed?
  end

  test "order completed through cancellation" do
    order = Order.new(status: "cancelled")
    assert_equal "Yes", order.completed?
  end

  test "order total" do
    order = Order.create
    stache_1 = create(:stache, price: 5.0)
    stache_2 = create(:stache, price: 3.0)
    stache_3 = create(:stache, price: 4.0)
    order_stache_1 = OrderStache.create(order_id: order.id,
                                        stache_id: stache_1.id,
                                        quantity: 2)
    order_stache_2 = OrderStache.create(order_id: order.id,
                                        stache_id: stache_2.id,
                                        quantity: 4)
    order_stache_3 = OrderStache.create(order_id: order.id,
                                        stache_id: stache_3.id,
                                        quantity: 1)
    order.order_staches << order_stache_1
    order.order_staches << order_stache_2
    order.order_staches << order_stache_3

    assert_equal 26.0, order.total
  end

  test "create order staches" do
    order = Order.create
    stache_1, stache_2, stache_3 = create_list(:stache, 3)
    cart = { stache_1.id.to_s => 3,
             stache_2.id.to_s => 5,
             stache_3.id.to_s => 2 }

    assert_equal 3, order.create_order_staches(cart).count
  end
end
