require 'test_helper'

class PicksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get picks_new_url
    assert_response :success
  end

end
