require "application_system_test_case"

class TopingsTest < ApplicationSystemTestCase
  setup do
    @toping = topings(:one)
  end

  test "visiting the index" do
    visit topings_url
    assert_selector "h1", text: "Topings"
  end

  test "should create toping" do
    visit topings_url
    click_on "New toping"

    fill_in "Name", with: @toping.name
    click_on "Create Toping"

    assert_text "Toping was successfully created"
    click_on "Back"
  end

  test "should update Toping" do
    visit toping_url(@toping)
    click_on "Edit this toping", match: :first

    fill_in "Name", with: @toping.name
    click_on "Update Toping"

    assert_text "Toping was successfully updated"
    click_on "Back"
  end

  test "should destroy Toping" do
    visit toping_url(@toping)
    click_on "Destroy this toping", match: :first

    assert_text "Toping was successfully destroyed"
  end
end
