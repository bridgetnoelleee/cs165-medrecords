require "application_system_test_case"

class MedicalhistoriesTest < ApplicationSystemTestCase
  setup do
    @medicalhistory = medicalhistories(:one)
  end

  test "visiting the index" do
    visit medicalhistories_url
    assert_selector "h1", text: "Medicalhistories"
  end

  test "creating a Medicalhistory" do
    visit medicalhistories_url
    click_on "New Medicalhistory"

    fill_in "Dateandtime", with: @medicalhistory.dateAndTime
    fill_in "Diseaseorcondition", with: @medicalhistory.diseaseOrCondition
    fill_in "Medication", with: @medicalhistory.medication
    click_on "Create Medicalhistory"

    assert_text "Medicalhistory was successfully created"
    click_on "Back"
  end

  test "updating a Medicalhistory" do
    visit medicalhistories_url
    click_on "Edit", match: :first

    fill_in "Dateandtime", with: @medicalhistory.dateAndTime
    fill_in "Diseaseorcondition", with: @medicalhistory.diseaseOrCondition
    fill_in "Medication", with: @medicalhistory.medication
    click_on "Update Medicalhistory"

    assert_text "Medicalhistory was successfully updated"
    click_on "Back"
  end

  test "destroying a Medicalhistory" do
    visit medicalhistories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Medicalhistory was successfully destroyed"
  end
end
