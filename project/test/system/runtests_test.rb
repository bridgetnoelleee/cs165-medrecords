require "application_system_test_case"

class RuntestsTest < ApplicationSystemTestCase
  setup do
    @runtest = runtests(:one)
  end

  test "visiting the index" do
    visit runtests_url
    assert_selector "h1", text: "Runtests"
  end

  test "creating a Runtest" do
    visit runtests_url
    click_on "New Runtest"

    fill_in "Dateandtime", with: @runtest.dateAndTime
    fill_in "Nurseid", with: @runtest.nurseID
    fill_in "Testid", with: @runtest.testID
    click_on "Create Runtest"

    assert_text "Runtest was successfully created"
    click_on "Back"
  end

  test "updating a Runtest" do
    visit runtests_url
    click_on "Edit", match: :first

    fill_in "Dateandtime", with: @runtest.dateAndTime
    fill_in "Nurseid", with: @runtest.nurseID
    fill_in "Testid", with: @runtest.testID
    click_on "Update Runtest"

    assert_text "Runtest was successfully updated"
    click_on "Back"
  end

  test "destroying a Runtest" do
    visit runtests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Runtest was successfully destroyed"
  end
end
