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

  test "returns total number of mustaches in cart" do
    cart = Cart.new("1" => 3, "2" => 1, "3" => 2)

    assert_equal 6, cart.total_quantity
  end

  test "returns total number of all mustaches in cart" do
    stache_1 = Stache.create(name: "Handlebar", description: "things", price: 5.0, image_url: "http://img.cdn.likes.com/img/fe8ea231575e2a180ad1d5a95822ef45.600x.jpg")
    stache_2 = Stache.create(name: "Chevron", description: "things", price: 3.0, image_url: "http://img.cdn.likes.com/img/fe8ea231575e2a180ad1d5a95822ef45.600x.jpg")
    stache_3 = Stache.create(name: "Dali", description: "things", price: 10.0, image_url: "http://img.cdn.likes.com/img/fe8ea231575e2a180ad1d5a95822ef45.600x.jpg")
    cart = Cart.new(stache_1.id => 2, stache_2.id => 3, stache_3.id => 1)

    assert_equal "29.00", cart.total_cost
  end
end
