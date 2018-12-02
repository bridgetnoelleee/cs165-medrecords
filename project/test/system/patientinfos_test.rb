require "application_system_test_case"

class PatientinfosTest < ApplicationSystemTestCase
  setup do
    @patientinfo = patientinfos(:one)
  end

  test "visiting the index" do
    visit patientinfos_url
    assert_selector "h1", text: "Patientinfos"
  end

  test "creating a Patientinfo" do
    visit patientinfos_url
    click_on "New Patientinfo"

    fill_in "Birthdate", with: @patientinfo.birthDate
    fill_in "Bloodtype", with: @patientinfo.bloodType
    fill_in "Currmedid", with: @patientinfo.currMedID
    fill_in "Datecreated", with: @patientinfo.dateCreated
    fill_in "Dateupdated", with: @patientinfo.dateUpdated
    fill_in "Emergencycontact", with: @patientinfo.emergencyContact
    fill_in "Name", with: @patientinfo.name
    click_on "Create Patientinfo"

    assert_text "Patientinfo was successfully created"
    click_on "Back"
  end

  test "updating a Patientinfo" do
    visit patientinfos_url
    click_on "Edit", match: :first

    fill_in "Birthdate", with: @patientinfo.birthDate
    fill_in "Bloodtype", with: @patientinfo.bloodType
    fill_in "Currmedid", with: @patientinfo.currMedID
    fill_in "Datecreated", with: @patientinfo.dateCreated
    fill_in "Dateupdated", with: @patientinfo.dateUpdated
    fill_in "Emergencycontact", with: @patientinfo.emergencyContact
    fill_in "Name", with: @patientinfo.name
    click_on "Update Patientinfo"

    assert_text "Patientinfo was successfully updated"
    click_on "Back"
  end

  test "destroying a Patientinfo" do
    visit patientinfos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Patientinfo was successfully destroyed"
  end
end
