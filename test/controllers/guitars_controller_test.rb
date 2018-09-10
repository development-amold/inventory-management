require 'test_helper'

class GuitarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guitar = guitars(:one)
  end

  test "should get index" do
    get guitars_url
    assert_response :success
  end

  test "should get new" do
    get new_guitar_url
    assert_response :success
  end

  test "should create guitar" do
    assert_difference('Guitar.count') do
      post guitars_url, params: { guitar: { brand_id: @guitar.brand_id, category_id: @guitar.category_id, name: @guitar.name, purchased_at: @guitar.purchased_at, stringscount: @guitar.stringscount, unit_price: @guitar.unit_price } }
    end

    assert_redirected_to guitar_url(Guitar.last)
  end

  test "should show guitar" do
    get guitar_url(@guitar)
    assert_response :success
  end

  test "should get edit" do
    get edit_guitar_url(@guitar)
    assert_response :success
  end

  test "should update guitar" do
    patch guitar_url(@guitar), params: { guitar: { brand_id: @guitar.brand_id, category_id: @guitar.category_id, name: @guitar.name, purchased_at: @guitar.purchased_at, stringscount: @guitar.stringscount, unit_price: @guitar.unit_price } }
    assert_redirected_to guitar_url(@guitar)
  end

  test "should destroy guitar" do
    assert_difference('Guitar.count', -1) do
      delete guitar_url(@guitar)
    end

    assert_redirected_to guitars_url
  end
end
