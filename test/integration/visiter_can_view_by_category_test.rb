require "test_helper"

class VisitorCanViewByCategory < ActionDispatch::IntegrationTest
  test "visitor can view by category" do
    stache_1, stache_2, stache_3 = create_list(:stache, 3)
    category_1, category_2, category_3 = create_list(:category, 3)
    category_1.staches << stache_1
    category_2.staches << stache_2
    category_3.staches << stache_3

    visit categories_path

    assert page.has_content?("#{category_1.title}")
    assert page.has_content?("#{category_2.title}")
    assert page.has_content?("#{category_3.title}")

    click_on "A category"

    assert_equal category_path(category_1), current_path
    assert page.has_content?("#{stache_1.name}")
    save_and_open_page
  end
end
