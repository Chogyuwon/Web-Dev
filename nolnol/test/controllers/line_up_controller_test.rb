require 'test_helper'

class LineUpControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get line_up_index_url
    assert_response :success
  end

end
