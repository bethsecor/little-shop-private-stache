require "test_helper"

class AdminDeletesItemTest < ActionDispatch::IntegrationTest
  test "admin can create a stache" do
    admin = create(:admin)
    stache = create(:stache)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_staches_path

    assert page.has_content?(stache.price)
    click_on "Delete"

    assert page.has_content?("#{stache.name} deleted")
    refute page.has_content?(stache.price)
  end
end
