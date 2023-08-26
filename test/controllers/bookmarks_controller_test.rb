require "test_helper"

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bookmarks_new_url
    assert_response :success
  end
end
