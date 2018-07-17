require 'test_helper'

class FollowlistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get followlist_index_url
    assert_response :success
  end

end
