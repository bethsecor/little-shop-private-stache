require "test_helper"

class AuthenticatedUserViewsPastOrdersTest < ActionDispatch::IntegrationTest
  test "logged in user can go to orders and see all their past orders" do
    user = create(:user)
    stache_1, stache_2, stache_3 = create_list(:stache, 3)
    order_1, order_2 = create_list(:order, 2)

    order_stache_1 = OrderStache.create(order_id: order_1.id,
                                        stache_id: stache_1.id, quantity: 2)
    order_stache_2 = OrderStache.create(order_id: order_1.id,
                                        stache_id: stache_2.id, quantity: 9)
    order_stache_3 = OrderStache.create(order_id: order_2.id,
                                        stache_id: stache_2.id, quantity: 3)
    order_stache_4 = OrderStache.create(order_id: order_2.id,
                                        stache_id: stache_3.id, quantity: 4)

    order_1.order_staches << order_stache_1
    order_1.order_staches << order_stache_2
    order_2.order_staches << order_stache_3
    order_2.order_staches << order_stache_4

    user.orders << order_1
    user.orders << order_2

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit orders_path

    save_and_open_page
    assert page.has_content?("Orders:")
    user.orders.each do |order|
      assert page.has_content?("#{order.id}")
      assert page.has_content?("#{order.status.capitalize}")
      assert page.has_link?("View Order Details")
    end
  end
end
