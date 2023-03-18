require "test_helper"

class Member::TrainingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get member_training_index_url
    assert_response :success
  end

  test "should get show" do
    get member_training_show_url
    assert_response :success
  end

  test "should get edit" do
    get member_training_edit_url
    assert_response :success
  end
end
