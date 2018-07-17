require 'test_helper'

class WatchingPeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get watching_people_index_url
    assert_response :success
  end

end
