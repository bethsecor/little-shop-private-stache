require "test_helper"

class VisitorNotAuthorizedToViewUserDataTest < ActionDispatch::IntegrationTest
  test "visitor cannot view other user's orders" do
    user1, user2 = create_list(:user, 2)
    order1 = user1.orders.create
    user1.orders.create

    visit order_path(order1)
    # add assertions for admin paths

    assert_equal login_path, current_path
  end
end
