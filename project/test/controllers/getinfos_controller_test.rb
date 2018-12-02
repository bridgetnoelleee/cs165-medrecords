require 'test_helper'

class GetinfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @getinfo = getinfos(:one)
  end

  test "should get index" do
    get getinfos_url
    assert_response :success
  end

  test "should get new" do
    get new_getinfo_url
    assert_response :success
  end

  test "should create getinfo" do
    assert_difference('Getinfo.count') do
      post getinfos_url, params: { getinfo: { nurseID: @getinfo.nurseID, patientID: @getinfo.patientID } }
    end

    assert_redirected_to getinfo_url(Getinfo.last)
  end

  test "should show getinfo" do
    get getinfo_url(@getinfo)
    assert_response :success
  end

  test "should get edit" do
    get edit_getinfo_url(@getinfo)
    assert_response :success
  end

  test "should update getinfo" do
    patch getinfo_url(@getinfo), params: { getinfo: { nurseID: @getinfo.nurseID, patientID: @getinfo.patientID } }
    assert_redirected_to getinfo_url(@getinfo)
  end

  test "should destroy getinfo" do
    assert_difference('Getinfo.count', -1) do
      delete getinfo_url(@getinfo)
    end

    assert_redirected_to getinfos_url
  end
end
