require 'test_helper'

class PatientinfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patientinfo = patientinfos(:one)
  end

  test "should get index" do
    get patientinfos_url
    assert_response :success
  end

  test "should get new" do
    get new_patientinfo_url
    assert_response :success
  end

  test "should create patientinfo" do
    assert_difference('Patientinfo.count') do
      post patientinfos_url, params: { patientinfo: { birthDate: @patientinfo.birthDate, bloodType: @patientinfo.bloodType, currMedID: @patientinfo.currMedID, dateCreated: @patientinfo.dateCreated, dateUpdated: @patientinfo.dateUpdated, emergencyContact: @patientinfo.emergencyContact, name: @patientinfo.name } }
    end

    assert_redirected_to patientinfo_url(Patientinfo.last)
  end

  test "should show patientinfo" do
    get patientinfo_url(@patientinfo)
    assert_response :success
  end

  test "should get edit" do
    get edit_patientinfo_url(@patientinfo)
    assert_response :success
  end

  test "should update patientinfo" do
    patch patientinfo_url(@patientinfo), params: { patientinfo: { birthDate: @patientinfo.birthDate, bloodType: @patientinfo.bloodType, currMedID: @patientinfo.currMedID, dateCreated: @patientinfo.dateCreated, dateUpdated: @patientinfo.dateUpdated, emergencyContact: @patientinfo.emergencyContact, name: @patientinfo.name } }
    assert_redirected_to patientinfo_url(@patientinfo)
  end

  test "should destroy patientinfo" do
    assert_difference('Patientinfo.count', -1) do
      delete patientinfo_url(@patientinfo)
    end

    assert_redirected_to patientinfos_url
  end
end
