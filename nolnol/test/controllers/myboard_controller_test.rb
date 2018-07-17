require 'test_helper'

class MyboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myboard_index_url
    assert_response :success
  end

  test "should get index2" do
    get myboard_index2_url
    assert_response :success
  end

end
