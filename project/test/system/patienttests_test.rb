require "application_system_test_case"

class PatienttestsTest < ApplicationSystemTestCase
  setup do
    @patienttest = patienttests(:one)
  end

  test "visiting the index" do
    visit patienttests_url
    assert_selector "h1", text: "Patienttests"
  end

  test "creating a Patienttest" do
    visit patienttests_url
    click_on "New Patienttest"

    fill_in "Dateandtime", with: @patienttest.dateAndTime
    fill_in "Patientid", with: @patienttest.patientID
    fill_in "Testid", with: @patienttest.testID
    click_on "Create Patienttest"

    assert_text "Patienttest was successfully created"
    click_on "Back"
  end

  test "updating a Patienttest" do
    visit patienttests_url
    click_on "Edit", match: :first

    fill_in "Dateandtime", with: @patienttest.dateAndTime
    fill_in "Patientid", with: @patienttest.patientID
    fill_in "Testid", with: @patienttest.testID
    click_on "Update Patienttest"

    assert_text "Patienttest was successfully updated"
    click_on "Back"
  end

  test "destroying a Patienttest" do
    visit patienttests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Patienttest was successfully destroyed"
  end
end
