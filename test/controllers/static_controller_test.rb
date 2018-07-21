require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get droper" do
    get static_droper_url
    assert_response :success
  end

end
