require "test_helper"

class Member::BookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get member_bookmarks_index_url
    assert_response :success
  end
end
