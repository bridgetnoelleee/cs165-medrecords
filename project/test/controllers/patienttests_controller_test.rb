require 'test_helper'

class PatienttestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patienttest = patienttests(:one)
  end

  test "should get index" do
    get patienttests_url
    assert_response :success
  end

  test "should get new" do
    get new_patienttest_url
    assert_response :success
  end

  test "should create patienttest" do
    assert_difference('Patienttest.count') do
      post patienttests_url, params: { patienttest: { dateAndTime: @patienttest.dateAndTime, patientID: @patienttest.patientID, testID: @patienttest.testID } }
    end

    assert_redirected_to patienttest_url(Patienttest.last)
  end

  test "should show patienttest" do
    get patienttest_url(@patienttest)
    assert_response :success
  end

  test "should get edit" do
    get edit_patienttest_url(@patienttest)
    assert_response :success
  end

  test "should update patienttest" do
    patch patienttest_url(@patienttest), params: { patienttest: { dateAndTime: @patienttest.dateAndTime, patientID: @patienttest.patientID, testID: @patienttest.testID } }
    assert_redirected_to patienttest_url(@patienttest)
  end

  test "should destroy patienttest" do
    assert_difference('Patienttest.count', -1) do
      delete patienttest_url(@patienttest)
    end

    assert_redirected_to patienttests_url
  end
end
