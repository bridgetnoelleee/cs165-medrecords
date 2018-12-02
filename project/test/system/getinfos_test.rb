require "application_system_test_case"

class GetinfosTest < ApplicationSystemTestCase
  setup do
    @getinfo = getinfos(:one)
  end

  test "visiting the index" do
    visit getinfos_url
    assert_selector "h1", text: "Getinfos"
  end

  test "creating a Getinfo" do
    visit getinfos_url
    click_on "New Getinfo"

    fill_in "Nurseid", with: @getinfo.nurseID
    fill_in "Patientid", with: @getinfo.patientID
    click_on "Create Getinfo"

    assert_text "Getinfo was successfully created"
    click_on "Back"
  end

  test "updating a Getinfo" do
    visit getinfos_url
    click_on "Edit", match: :first

    fill_in "Nurseid", with: @getinfo.nurseID
    fill_in "Patientid", with: @getinfo.patientID
    click_on "Update Getinfo"

    assert_text "Getinfo was successfully updated"
    click_on "Back"
  end

  test "destroying a Getinfo" do
    visit getinfos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Getinfo was successfully destroyed"
  end
end
