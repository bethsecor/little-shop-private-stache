require "test_helper"

class AdminCreatesCategoryTest < ActionDispatch::IntegrationTest
  test "admin creates category" do
    admin = create(:user, role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_path
    click_on "View All Categories"

    assert_equal admin_categories_path, current_path

    fill_in "Title", with: "Dictator"
    click_on "Create Category"
    category = Category.last

    assert page.has_content?("New category #{category.title} created")
    assert Category.pluck(:title).include?("Dictator")
  end
end