require "test_helper"

class Member::CommentControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get member_comment_show_url
    assert_response :success
  end

  test "should get edit" do
    get member_comment_edit_url
    assert_response :success
  end
end
