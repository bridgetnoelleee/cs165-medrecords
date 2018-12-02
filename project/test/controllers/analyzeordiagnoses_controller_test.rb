require 'test_helper'

class AnalyzeordiagnosesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analyzeordiagnosis = analyzeordiagnoses(:one)
  end

  test "should get index" do
    get analyzeordiagnoses_url
    assert_response :success
  end

  test "should get new" do
    get new_analyzeordiagnosis_url
    assert_response :success
  end

  test "should create analyzeordiagnosis" do
    assert_difference('Analyzeordiagnose.count') do
      post analyzeordiagnoses_url, params: { analyzeordiagnosis: { doctorID: @analyzeordiagnosis.doctorID, medHisID: @analyzeordiagnosis.medHisID } }
    end

    assert_redirected_to analyzeordiagnosis_url(Analyzeordiagnose.last)
  end

  test "should show analyzeordiagnosis" do
    get analyzeordiagnosis_url(@analyzeordiagnosis)
    assert_response :success
  end

  test "should get edit" do
    get edit_analyzeordiagnosis_url(@analyzeordiagnosis)
    assert_response :success
  end

  test "should update analyzeordiagnosis" do
    patch analyzeordiagnosis_url(@analyzeordiagnosis), params: { analyzeordiagnosis: { doctorID: @analyzeordiagnosis.doctorID, medHisID: @analyzeordiagnosis.medHisID } }
    assert_redirected_to analyzeordiagnosis_url(@analyzeordiagnosis)
  end

  test "should destroy analyzeordiagnosis" do
    assert_difference('Analyzeordiagnose.count', -1) do
      delete analyzeordiagnosis_url(@analyzeordiagnosis)
    end

    assert_redirected_to analyzeordiagnoses_url
  end
end
