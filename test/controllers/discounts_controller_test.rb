require "test_helper"

class DiscountsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get discounts_new_url
    assert_response :success
  end
end
