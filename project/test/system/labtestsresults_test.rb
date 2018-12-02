require "application_system_test_case"

class LabtestsresultsTest < ApplicationSystemTestCase
  setup do
    @labtestsresult = labtestsresults(:one)
  end

  test "visiting the index" do
    visit labtestsresults_url
    assert_selector "h1", text: "Labtestsresults"
  end

  test "creating a Labtestsresult" do
    visit labtestsresults_url
    click_on "New Labtestsresult"

    fill_in "Dateandtime", with: @labtestsresult.dateAndTime
    fill_in "Testid", with: @labtestsresult.testID
    fill_in "Testname", with: @labtestsresult.testName
    fill_in "Testresults", with: @labtestsresult.testResults
    click_on "Create Labtestsresult"

    assert_text "Labtestsresult was successfully created"
    click_on "Back"
  end

  test "updating a Labtestsresult" do
    visit labtestsresults_url
    click_on "Edit", match: :first

    fill_in "Dateandtime", with: @labtestsresult.dateAndTime
    fill_in "Testid", with: @labtestsresult.testID
    fill_in "Testname", with: @labtestsresult.testName
    fill_in "Testresults", with: @labtestsresult.testResults
    click_on "Update Labtestsresult"

    assert_text "Labtestsresult was successfully updated"
    click_on "Back"
  end

  test "destroying a Labtestsresult" do
    visit labtestsresults_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Labtestsresult was successfully destroyed"
  end
end
