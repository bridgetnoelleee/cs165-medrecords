require 'test_helper'

class LabtestsresultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labtestsresult = labtestsresults(:one)
  end

  test "should get index" do
    get labtestsresults_url
    assert_response :success
  end

  test "should get new" do
    get new_labtestsresult_url
    assert_response :success
  end

  test "should create labtestsresult" do
    assert_difference('Labtestsresult.count') do
      post labtestsresults_url, params: { labtestsresult: { dateAndTime: @labtestsresult.dateAndTime, testID: @labtestsresult.testID, testName: @labtestsresult.testName, testResults: @labtestsresult.testResults } }
    end

    assert_redirected_to labtestsresult_url(Labtestsresult.last)
  end

  test "should show labtestsresult" do
    get labtestsresult_url(@labtestsresult)
    assert_response :success
  end

  test "should get edit" do
    get edit_labtestsresult_url(@labtestsresult)
    assert_response :success
  end

  test "should update labtestsresult" do
    patch labtestsresult_url(@labtestsresult), params: { labtestsresult: { dateAndTime: @labtestsresult.dateAndTime, testID: @labtestsresult.testID, testName: @labtestsresult.testName, testResults: @labtestsresult.testResults } }
    assert_redirected_to labtestsresult_url(@labtestsresult)
  end

  test "should destroy labtestsresult" do
    assert_difference('Labtestsresult.count', -1) do
      delete labtestsresult_url(@labtestsresult)
    end

    assert_redirected_to labtestsresults_url
  end
end
