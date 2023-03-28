require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end
  test "should get home" do
    get main_home_url
    assert_response :success
  end
end
