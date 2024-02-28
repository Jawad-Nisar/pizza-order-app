require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit orders_url
    click_on "New order"

    check "Completed" if @order.completed
    fill_in "Discount code", with: @order.discount_code
    fill_in "Items", with: @order.items_id
    fill_in "Promotion code", with: @order.promotion_code
    fill_in "Topings", with: @order.topings_id
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit order_url(@order)
    click_on "Edit this order", match: :first

    check "Completed" if @order.completed
    fill_in "Discount code", with: @order.discount_code
    fill_in "Items", with: @order.items_id
    fill_in "Promotion code", with: @order.promotion_code
    fill_in "Topings", with: @order.topings_id
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "should destroy Order" do
    visit order_url(@order)
    click_on "Destroy this order", match: :first

    assert_text "Order was successfully destroyed"
  end
end
