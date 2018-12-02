require "application_system_test_case"

class AnalyzeordiagnosesTest < ApplicationSystemTestCase
  setup do
    @analyzeordiagnosis = analyzeordiagnoses(:one)
  end

  test "visiting the index" do
    visit analyzeordiagnoses_url
    assert_selector "h1", text: "Analyzeordiagnoses"
  end

  test "creating a Analyzeordiagnose" do
    visit analyzeordiagnoses_url
    click_on "New Analyzeordiagnose"

    fill_in "Doctorid", with: @analyzeordiagnosis.doctorID
    fill_in "Medhisid", with: @analyzeordiagnosis.medHisID
    click_on "Create Analyzeordiagnose"

    assert_text "Analyzeordiagnose was successfully created"
    click_on "Back"
  end

  test "updating a Analyzeordiagnose" do
    visit analyzeordiagnoses_url
    click_on "Edit", match: :first

    fill_in "Doctorid", with: @analyzeordiagnosis.doctorID
    fill_in "Medhisid", with: @analyzeordiagnosis.medHisID
    click_on "Update Analyzeordiagnose"

    assert_text "Analyzeordiagnose was successfully updated"
    click_on "Back"
  end

  test "destroying a Analyzeordiagnose" do
    visit analyzeordiagnoses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Analyzeordiagnose was successfully destroyed"
  end
end
