require 'test_helper'

class JujumControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jujum_index_url
    assert_response :success
  end

end
