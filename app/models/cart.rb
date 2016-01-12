class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_stache(stache_id)
    contents[stache_id.to_s] ||= 0
    contents[stache_id.to_s] += 1
  end

  def delete_stache(stache_id)
    contents.delete(stache_id.to_s)
  end

  def staches
    Stache.find(contents.keys)
  end

  def stache_cost(stache_id)
    Stache.find(stache_id).price * contents[stache_id.to_s]
  end

  def total_quantity
    contents.values.sum
  end

  def total_cost
    "%.2f" % contents.map {|stache_id, quantity| Stache.find(stache_id).price * quantity}.sum
  end
end
