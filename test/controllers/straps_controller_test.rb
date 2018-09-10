require 'test_helper'

class StrapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @strap = straps(:one)
  end

  test "should get index" do
    get straps_url
    assert_response :success
  end

  test "should get new" do
    get new_strap_url
    assert_response :success
  end

  test "should create strap" do
    assert_difference('Strap.count') do
      post straps_url, params: { strap: { name: @strap.name } }
    end

    assert_redirected_to strap_url(Strap.last)
  end

  test "should show strap" do
    get strap_url(@strap)
    assert_response :success
  end

  test "should get edit" do
    get edit_strap_url(@strap)
    assert_response :success
  end

  test "should update strap" do
    patch strap_url(@strap), params: { strap: { name: @strap.name } }
    assert_redirected_to strap_url(@strap)
  end

  test "should destroy strap" do
    assert_difference('Strap.count', -1) do
      delete strap_url(@strap)
    end

    assert_redirected_to straps_url
  end
end
