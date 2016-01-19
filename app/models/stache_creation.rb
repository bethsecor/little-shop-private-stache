class StacheCreation
  attr_reader :stache, :categories, :status

  def initialize(stache, categories, status)
    @stache = stache
    @categories = categories
    @status = status
  end

  def create
    if status == 1
      @stache.retired = true
    end
    @stache.categories << Category.find(categories)
    stache.save
  end
end
