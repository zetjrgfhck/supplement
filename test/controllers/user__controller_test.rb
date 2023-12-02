require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get comments" do
    get user__comments_url
    assert_response :success
  end
end
