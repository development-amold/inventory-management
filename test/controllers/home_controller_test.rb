require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get Dashboard" do
    get home_Dashboard_url
    assert_response :success
  end

  test "should get Orders" do
    get home_Orders_url
    assert_response :success
  end

  test "should get ProductTrack" do
    get home_ProductTrack_url
    assert_response :success
  end

end
