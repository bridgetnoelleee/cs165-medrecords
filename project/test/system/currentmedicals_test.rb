require "application_system_test_case"

class CurrentmedicalsTest < ApplicationSystemTestCase
  setup do
    @currentmedical = currentmedicals(:one)
  end

  test "visiting the index" do
    visit currentmedicals_url
    assert_selector "h1", text: "Currentmedicals"
  end

  test "creating a Currentmedical" do
    visit currentmedicals_url
    click_on "New Currentmedical"

    fill_in "Allergies", with: @currentmedical.allergies
    fill_in "Bloodpressure", with: @currentmedical.bloodPressure
    fill_in "Datecreated", with: @currentmedical.dateCreated
    fill_in "Dateupdated", with: @currentmedical.dateUpdated
    fill_in "Height", with: @currentmedical.height
    fill_in "Medications", with: @currentmedical.medications
    fill_in "Symptoms", with: @currentmedical.symptoms
    fill_in "Weight", with: @currentmedical.weight
    click_on "Create Currentmedical"

    assert_text "Currentmedical was successfully created"
    click_on "Back"
  end

  test "updating a Currentmedical" do
    visit currentmedicals_url
    click_on "Edit", match: :first

    fill_in "Allergies", with: @currentmedical.allergies
    fill_in "Bloodpressure", with: @currentmedical.bloodPressure
    fill_in "Datecreated", with: @currentmedical.dateCreated
    fill_in "Dateupdated", with: @currentmedical.dateUpdated
    fill_in "Height", with: @currentmedical.height
    fill_in "Medications", with: @currentmedical.medications
    fill_in "Symptoms", with: @currentmedical.symptoms
    fill_in "Weight", with: @currentmedical.weight
    click_on "Update Currentmedical"

    assert_text "Currentmedical was successfully updated"
    click_on "Back"
  end

  test "destroying a Currentmedical" do
    visit currentmedicals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Currentmedical was successfully destroyed"
  end
end
