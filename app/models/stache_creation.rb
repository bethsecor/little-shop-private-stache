class StacheCreation
  attr_reader :stache, :categories

  def initialize(stache, categories)
    @stache = stache
    @categories = categories
  end

  def create
    @stache.categories << Category.find(categories)
    stache.save
  end
end
