require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "formats a date" do
    date = DateTime.new(2002, 10, 31, 2, 2, 2, "+02:00")
    order = Order.create(created_at: date)

    assert_equal "10/30/2002 at 05:02 PM", order.formatted_created_date
  end
end
