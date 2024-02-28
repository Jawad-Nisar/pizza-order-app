require "test_helper"

class TopingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @toping = topings(:one)
  end

  test "should get index" do
    get topings_url
    assert_response :success
  end

  test "should get new" do
    get new_toping_url
    assert_response :success
  end

  test "should create toping" do
    assert_difference("Toping.count") do
      post topings_url, params: { toping: { name: @toping.name } }
    end

    assert_redirected_to toping_url(Toping.last)
  end

  test "should show toping" do
    get toping_url(@toping)
    assert_response :success
  end

  test "should get edit" do
    get edit_toping_url(@toping)
    assert_response :success
  end

  test "should update toping" do
    patch toping_url(@toping), params: { toping: { name: @toping.name } }
    assert_redirected_to toping_url(@toping)
  end

  test "should destroy toping" do
    assert_difference("Toping.count", -1) do
      delete toping_url(@toping)
    end

    assert_redirected_to topings_url
  end
end
