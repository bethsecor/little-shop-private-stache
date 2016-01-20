require "test_helper"

class AdminCreatesCategoryTest < ActionDispatch::IntegrationTest
  test "admin creates category" do
    admin = create(:user, role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_path
    click_on "View All Categories"

    assert_equal admin_categories_path, current_path

    fill_in "Title", with: "Dictator"
    click_on "Stache that Category!"
    category = Category.last

    assert page.has_content?("New category #{category.title} created")
    assert Category.pluck(:title).include?("Dictator")

    click_on "Edit"
    fill_in "Title", with: "Pacman"
    click_on "Stache that Category!"

    assert page.has_content?("Pacman")

    click_on "Remove"

    assert page.has_content?("Pacman removed")

    category = create(:category)
    category.staches << create(:stache)

    visit admin_categories_path

    refute page.has_content?("Remove")
  end
end
