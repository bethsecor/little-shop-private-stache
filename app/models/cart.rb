class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_stache(stache_id)
    contents[stache_id.to_s] ||= 0
    contents[stache_id.to_s] += 1
  end

  def staches
    Stache.find(contents.keys)
  end

  def total_quantity
    contents.values.sum
  end

  def total_cost
    contents.reduce()
  end
end
