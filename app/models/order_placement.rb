class OrderPlacement
  attr_reader :order, :cart

  def initialize(order, cart)
    @order = order
    @cart = cart
  end

  def create
    if order.save
      order.create_order_staches(cart)
    end
  end
end
