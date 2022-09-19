require "test_helper"

class Admin::OrderDitailsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_order_ditails_update_url
    assert_response :success
  end
end
