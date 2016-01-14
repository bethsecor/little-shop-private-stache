require 'test_helper'

class UserViewsPastOrderTest < ActionDispatch::IntegrationTest
  test "user with one order can view past order" do
    user = create(:user)
    stache_1, stache_2 = create_list(:stache, 2)
    stache_3 = Stache.create(name: "Dali", description: "things", price: 10.0, retired: true, image_url: "http://images.clipartpanda.com/mustache-clipart-ecMA4abcn.svg")
    order = create(:order)

    order_stache_1 = OrderStache.create(order_id: order.id, stache_id: stache_1.id, quantity: 2)
    order_stache_2 = OrderStache.create(order_id: order.id, stache_id: stache_2.id, quantity: 9)
    order_stache_3 = OrderStache.create(order_id: order.id, stache_id: stache_3.id, quantity: 5)

    order.order_staches << order_stache_1
    order.order_staches << order_stache_2
    order.order_staches << order_stache_3

    user.orders << order
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit orders_path
    click_on "View Order Details"

    assert order_path(order), current_path
    assert page.has_content?("Order Number: #{order.id}")

    order.staches.each do |stache|
      assert page.has_content?("Stache: #{stache.name}")
      assert page.has_link?(stache.name)
      assert page.has_content?("Quantity: #{stache.quantity}")
      assert page.has_content?("Subtotal: #{stache.subtotal}")
    end

    assert page.has_content?("Order Status: #{order.status}")
    assert page.has_content?("Total: #{order.total}")
    assert page.has_content?("Order Placed: #{order.created_at}")
    assert page.has_content?("Order Complete: #{order.completed?}")
    assert page.has_content?("Order Updated At: #{order.updated_at}")

    click_on "#{stache_3.name}"
    refute page.has_link?("Add To Cart")
  end
end
