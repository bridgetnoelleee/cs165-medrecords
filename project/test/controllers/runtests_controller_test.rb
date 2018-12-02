require 'test_helper'

class RuntestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @runtest = runtests(:one)
  end

  test "should get index" do
    get runtests_url
    assert_response :success
  end

  test "should get new" do
    get new_runtest_url
    assert_response :success
  end

  test "should create runtest" do
    assert_difference('Runtest.count') do
      post runtests_url, params: { runtest: { dateAndTime: @runtest.dateAndTime, nurseID: @runtest.nurseID, testID: @runtest.testID } }
    end

    assert_redirected_to runtest_url(Runtest.last)
  end

  test "should show runtest" do
    get runtest_url(@runtest)
    assert_response :success
  end

  test "should get edit" do
    get edit_runtest_url(@runtest)
    assert_response :success
  end

  test "should update runtest" do
    patch runtest_url(@runtest), params: { runtest: { dateAndTime: @runtest.dateAndTime, nurseID: @runtest.nurseID, testID: @runtest.testID } }
    assert_redirected_to runtest_url(@runtest)
  end

  test "should destroy runtest" do
    assert_difference('Runtest.count', -1) do
      delete runtest_url(@runtest)
    end

    assert_redirected_to runtests_url
  end
end
