require "application_system_test_case"

class PatienthistoriesTest < ApplicationSystemTestCase
  setup do
    @patienthistory = patienthistories(:one)
  end

  test "visiting the index" do
    visit patienthistories_url
    assert_selector "h1", text: "Patienthistories"
  end

  test "creating a Patienthistory" do
    visit patienthistories_url
    click_on "New Patienthistory"

    fill_in "Medhisid", with: @patienthistory.medHisID
    fill_in "Patientid", with: @patienthistory.patientID
    click_on "Create Patienthistory"

    assert_text "Patienthistory was successfully created"
    click_on "Back"
  end

  test "updating a Patienthistory" do
    visit patienthistories_url
    click_on "Edit", match: :first

    fill_in "Medhisid", with: @patienthistory.medHisID
    fill_in "Patientid", with: @patienthistory.patientID
    click_on "Update Patienthistory"

    assert_text "Patienthistory was successfully updated"
    click_on "Back"
  end

  test "destroying a Patienthistory" do
    visit patienthistories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Patienthistory was successfully destroyed"
  end
end
