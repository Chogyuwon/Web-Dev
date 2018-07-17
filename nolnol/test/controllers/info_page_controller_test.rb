require 'test_helper'

class InfoPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get info_page_index_url
    assert_response :success
  end

end
