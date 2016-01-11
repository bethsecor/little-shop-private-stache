require 'test_helper'

class VisitorCanViewItemsTest < ActionDispatch::IntegrationTest
  test "visitor can view all items" do
    stache_1, stache_2, stache_3 = create_list(:stache, 3)

    visit staches_path

    assert page.has_content?("#{stache_1.name}")
    assert page.has_content?("#{stache_2.name}")
    assert page.has_content?("#{stache_3.name}")
  end
end
