require 'test_helper'

class MedicalhistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medicalhistory = medicalhistories(:one)
  end

  test "should get index" do
    get medicalhistories_url
    assert_response :success
  end

  test "should get new" do
    get new_medicalhistory_url
    assert_response :success
  end

  test "should create medicalhistory" do
    assert_difference('Medicalhistory.count') do
      post medicalhistories_url, params: { medicalhistory: { dateAndTime: @medicalhistory.dateAndTime, diseaseOrCondition: @medicalhistory.diseaseOrCondition, medication: @medicalhistory.medication } }
    end

    assert_redirected_to medicalhistory_url(Medicalhistory.last)
  end

  test "should show medicalhistory" do
    get medicalhistory_url(@medicalhistory)
    assert_response :success
  end

  test "should get edit" do
    get edit_medicalhistory_url(@medicalhistory)
    assert_response :success
  end

  test "should update medicalhistory" do
    patch medicalhistory_url(@medicalhistory), params: { medicalhistory: { dateAndTime: @medicalhistory.dateAndTime, diseaseOrCondition: @medicalhistory.diseaseOrCondition, medication: @medicalhistory.medication } }
    assert_redirected_to medicalhistory_url(@medicalhistory)
  end

  test "should destroy medicalhistory" do
    assert_difference('Medicalhistory.count', -1) do
      delete medicalhistory_url(@medicalhistory)
    end

    assert_redirected_to medicalhistories_url
  end
end
