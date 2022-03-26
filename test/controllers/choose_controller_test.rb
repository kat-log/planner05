require "test_helper"

class ChooseControllerTest < ActionDispatch::IntegrationTest
  test "should get choose_page" do
    get choose_choose_page_url
    assert_response :success
  end
end
