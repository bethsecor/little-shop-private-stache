require "test_helper"

class UserCannotViewOtherUsersOrdersTest < ActionDispatch::IntegrationTest
  test "user cannot view other user's orders" do
    user1, user2 = create_list(:user, 2)
    order1 = user1.orders.create
    user1.orders.create

    ApplicationController.any_instance.stubs(:current_user).returns(user2)

    assert_raises(ActiveRecord::RecordNotFound) do
      visit order_path(order1)
    end
  end
end
