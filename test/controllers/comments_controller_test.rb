require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get _comment" do
    get comments__comment_url
    assert_response :success
  end
end
