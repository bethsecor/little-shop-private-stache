require "test_helper"

class OrderStacheTest < ActiveSupport::TestCase
  should validate_presence_of(:quantity)
  should validate_numericality_of(:quantity).is_greater_than_or_equal_to(0)
end
