require "test_helper"

class BibleControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get bible_home_url
    assert_response :success
  end
end
