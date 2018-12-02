require 'test_helper'

class PatienthistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patienthistory = patienthistories(:one)
  end

  test "should get index" do
    get patienthistories_url
    assert_response :success
  end

  test "should get new" do
    get new_patienthistory_url
    assert_response :success
  end

  test "should create patienthistory" do
    assert_difference('Patienthistory.count') do
      post patienthistories_url, params: { patienthistory: { medHisID: @patienthistory.medHisID, patientID: @patienthistory.patientID } }
    end

    assert_redirected_to patienthistory_url(Patienthistory.last)
  end

  test "should show patienthistory" do
    get patienthistory_url(@patienthistory)
    assert_response :success
  end

  test "should get edit" do
    get edit_patienthistory_url(@patienthistory)
    assert_response :success
  end

  test "should update patienthistory" do
    patch patienthistory_url(@patienthistory), params: { patienthistory: { medHisID: @patienthistory.medHisID, patientID: @patienthistory.patientID } }
    assert_redirected_to patienthistory_url(@patienthistory)
  end

  test "should destroy patienthistory" do
    assert_difference('Patienthistory.count', -1) do
      delete patienthistory_url(@patienthistory)
    end

    assert_redirected_to patienthistories_url
  end
end
