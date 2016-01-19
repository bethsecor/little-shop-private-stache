require "test_helper"

class UserViewsPastOrderTest < ActionDispatch::IntegrationTest
  test "user with two orders can view a past order" do
    user = create(:user)
    stache_1, stache_2 = create_list(:stache, 2)
    stache_3 = create(:stache, name: "Dali",
                               description: "things",
                               price: 10.0,
                               retired: true,
                               image_url: "http://images.clipartpanda.com/\
                                           mustache-clipart-ecMA4abcn.svg")
    order = create(:order)

    order_stache_1 = OrderStache.create(order_id: order.id,
                                        stache_id: stache_1.id,
                                        quantity: 2)
    order_stache_2 = OrderStache.create(order_id: order.id,
                                        stache_id: stache_2.id,
                                        quantity: 9)
    order_stache_3 = OrderStache.create(order_id: order.id,
                                        stache_id: stache_3.id,
                                        quantity: 5)

    order.order_staches << order_stache_1
    order.order_staches << order_stache_2
    order.order_staches << order_stache_3

    user.orders << order

    order_2 = Order.new

    order_stache_4 = OrderStache.create(order_id: order_2.id,
                                        stache_id: stache_3.id,
                                        quantity: 3)
    order_stache_5 = OrderStache.create(order_id: order_2.id,
                                        stache_id: stache_2.id,
                                        quantity: 100)
    order_stache_6 = OrderStache.create(order_id: order_2.id,
                                        stache_id: stache_1.id,
                                        quantity: 84)

    order_2.order_staches << order_stache_4
    order_2.order_staches << order_stache_5
    order_2.order_staches << order_stache_6

    user.orders << order_2
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit orders_path
    click_on "order-#{order.id}"

    assert order_path(order), current_path
    assert page.has_content?("Order Number: #{order.id}")

    order.staches.each do |stache|
      assert page.has_link?(stache.name)
      assert page.has_content?("#{order.quantity(stache)}")
      assert page.has_content?("#{order.subtotal(stache)}")
    end

    assert page.has_content?("Order Status: #{order.status.capitalize}")
    assert page.has_content?("Total: $#{order.total}")
    assert page.has_content?("Order Placed: #{order.formatted_created_date}")
    assert page.has_content?("Order Complete: #{order.completed?}")
    assert page.has_content?("Order Last Updated:\
                              #{order.formatted_updated_date}")

    click_on "#{stache_3.name}"
    refute page.has_link?("Add to Cart")
  end
end
