require "test_helper"

class AdminViewOrdersTest < ActionDispatch::IntegrationTest
  test "admin sees all orders on the dashboard page" do
    # And I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")
    # And I can filter orders to display by each status type  ("Ordered", "Paid", "Cancelled", "Completed")

    create_eight_orders_for_user
    admin = User.create(username: "admin", password: "pw", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_path

    assert_equal admin_dashboard_path, current_path
    assert page.has_content?("Admin StacheBoard")
    within("#admin-orders-table") do
      Order.all.each do |order|
        assert page.has_content?(order.id)
        assert page.has_content?(order.status.capitalize)
        assert page.has_link?("order-#{order.id}-link")

        if %w(ordered).include?(order.status)
          assert page.has_link?("order-#{order.id}-paid")
          assert page.has_link?("order-#{order.id}-cancel")
        end

        if %w(paid).include?(order.status)
          assert page.has_link?("order-#{order.id}-complete")
          assert page.has_link?("order-#{order.id}-cancel")
        end
      end
    end
  end

  test "admin can change status of ordered order to paid" do
    create_eight_orders_for_user
    admin = User.create(username: "admin", password: "pw", role: 1)
    order = Order.find_by(status: "ordered")
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_path
    click_on "order-#{order.id}-paid"
    assert Order.find(order.id).status == "paid"

    assert_equal current_path, admin_dashboard_path
    within("#order-#{order.id}") do
      assert page.has_content?("Paid")
      refute page.has_content?("Ordered")
    end
  end

  test "admin can change status of paid order to complete" do
    create_eight_orders_for_user
    admin = User.create(username: "admin", password: "pw", role: 1)
    order = Order.find_by(status: "paid")
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_path
    click_on "order-#{order.id}-complete"
    assert Order.find(order.id).status == "completed"

    assert_equal current_path, admin_dashboard_path
    within("#order-#{order.id}") do
      assert page.has_content?("Completed")
      refute page.has_content?("Paid")
    end
  end

  test "admin can change status of ordered order to cancelled" do
    create_eight_orders_for_user
    admin = User.create(username: "admin", password: "pw", role: 1)
    order = Order.find_by(status: "ordered")
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_path
    click_on "order-#{order.id}-cancel"
    assert Order.find(order.id).status == "cancelled"

    assert_equal current_path, admin_dashboard_path
    within("#order-#{order.id}") do
      assert page.has_content?("Cancelled")
      refute page.has_content?("Ordered")
    end
  end

  test "admin can change status of paid order to cancelled" do
    create_eight_orders_for_user
    admin = User.create(username: "admin", password: "pw", role: 1)
    order = Order.find_by(status: "paid")
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_path
    click_on "order-#{order.id}-cancel"
    assert Order.find(order.id).status == "cancelled"

    assert_equal current_path, admin_dashboard_path
    within("#order-#{order.id}") do
      assert page.has_content?("Cancelled")
      refute page.has_content?("Paid")
    end
  end
end
