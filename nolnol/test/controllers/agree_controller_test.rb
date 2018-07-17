require 'test_helper'

class AgreeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get agree_index_url
    assert_response :success
  end

end
