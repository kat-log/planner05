require "test_helper"

class ResultControllerTest < ActionDispatch::IntegrationTest
  test "should get result_page" do
    get result_result_page_url
    assert_response :success
  end
end
