require "test_helper"

class OrderTest < ActiveSupport::TestCase
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:address)
  should validate_presence_of(:city)
  should validate_presence_of(:state)
  should validate_presence_of(:zipcode)
  should validate_numericality_of(:zipcode)
  should validate_inclusion_of(:status).in_array(%w(ordered paid
                                                    cancelled completed))

  test "before create set ordered status" do
    order_1 = Order.create(first_name: "Beth", last_name: "Secor",
                           address: "1510 Blake St.", city: "Denver",
                           state: "CO", zipcode: "80202")
    assert order_1.status == "ordered"
  end

  test "zipcode is five digits" do
    order_1 = build(:order)
    assert order_1.valid?
    order_2 = build(:order, zipcode: 2)
    refute order_2.valid?
    order_3 = build(:order, zipcode: 202_020_202)
    refute order_3.valid?
  end

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
    order = create(:order, status: "completed")
    assert_equal "Yes", order.completed?
  end

  test "order completed through cancellation" do
    order = create(:order, status: "cancelled")
    assert_equal "Yes", order.completed?
  end

  test "order total" do
    order = create(:order)

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
    order = create(:order)
    stache_1, stache_2, stache_3 = create_list(:stache, 3)
    cart = { stache_1.id.to_s => 3,
             stache_2.id.to_s => 5,
             stache_3.id.to_s => 2 }

    assert_equal 3, order.create_order_staches(cart).count
  end

  test "order status count" do
    create(:order, status: "ordered")
    create(:order, status: "paid")
    create(:order, status: "paid")
    create(:order, status: "completed")

    expected = [["Ordered", 1], ["Paid", 2], ["Completed", 1], ["Cancelled", 0]]
    assert_equal expected, Order.order_status_count
  end
end
