require "application_system_test_case"

class AdventuresTest < ApplicationSystemTestCase
  setup do
    @adventure = adventures(:one)
  end

  test "visiting the index" do
    visit adventures_url
    assert_selector "h1", text: "Adventures"
  end

  test "should create adventure" do
    visit adventures_url
    click_on "New adventure"

    fill_in "Description", with: @adventure.description
    fill_in "Place", with: @adventure.place
    fill_in "Title", with: @adventure.title
    fill_in "When went", with: @adventure.when_went
    click_on "Create Adventure"

    assert_text "Adventure was successfully created"
    click_on "Back"
  end

  test "should update Adventure" do
    visit adventure_url(@adventure)
    click_on "Edit this adventure", match: :first

    fill_in "Description", with: @adventure.description
    fill_in "Place", with: @adventure.place
    fill_in "Title", with: @adventure.title
    fill_in "When went", with: @adventure.when_went
    click_on "Update Adventure"

    assert_text "Adventure was successfully updated"
    click_on "Back"
  end

  test "should destroy Adventure" do
    visit adventure_url(@adventure)
    click_on "Destroy this adventure", match: :first

    assert_text "Adventure was successfully destroyed"
  end
end
