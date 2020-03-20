require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get like" do
    get comments_like_url
    assert_response :success
  end

  test "should get dislike" do
    get comments_dislike_url
    assert_response :success
  end

end
