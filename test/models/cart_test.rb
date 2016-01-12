class CartTest < ActiveSupport::TestCase
  test "has initial contents" do
    cart = Cart.new({ "1" => 1 })

    assert_equal({ "1" => 1 }, cart.contents)
  end

  test "can add a mustache" do
    cart = Cart.new({ "1" => 1})

    cart.add_stache(1)
    cart.add_stache(2)

    assert_equal({ "1" => 2, "2" => 1}, cart.contents)
  end

  test "returns total number of all mustaches in cart" do
    cart = Cart.new({ "1" => 2, "2" => 1, "3" => 3})

    assert_equal 6, cart.total_cost
  end
end
