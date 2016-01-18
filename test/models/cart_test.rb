class CartTest < ActiveSupport::TestCase
  test "has initial contents" do
    cart = Cart.new("1" => 1)

    assert_equal({ "1" => 1 }, cart.contents)
  end

  test "can add a mustache" do
    cart = Cart.new("1" => 1)

    cart.add_stache(1)
    cart.add_stache(2)

    assert_equal({ "1" => 2, "2" => 1 }, cart.contents)
  end

  test "can delete a mustache" do
    cart = Cart.new("1" => 2, "3" => 4)

    cart.delete_stache(3)

    assert_equal({ "1" => 2 }, cart.contents)
  end

  test "returns total number of mustaches in cart" do
    cart = Cart.new("1" => 3, "2" => 1, "3" => 2)

    assert_equal 6, cart.total_quantity
  end

  test "returns total number of all mustaches in cart" do
    stache_1 = Stache.create(name: "Handlebar", price: 5.0)
    stache_2 = Stache.create(name: "Chevron", price: 3.0)
    stache_3 = Stache.create(name: "Dali", price: 10.0)
    cart = Cart.new(stache_1.id => 2, stache_2.id => 3, stache_3.id => 1)

    assert_equal 29.0, cart.total_cost
  end

  test "staches finds all staches in cart" do
    stache_1 = Stache.create(name: "Handlebar", price: 5.0)
    stache_2 = Stache.create(name: "Chevron", price: 3.0)
    stache_3 = Stache.create(name: "Dali", price: 10.0)
    cart = Cart.new(stache_1.id => 2, stache_2.id => 3, stache_3.id => 1)

    assert_equal [stache_1, stache_2, stache_3], cart.staches
  end
end
