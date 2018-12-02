require 'test_helper'

class CurrentmedicalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currentmedical = currentmedicals(:one)
  end

  test "should get index" do
    get currentmedicals_url
    assert_response :success
  end

  test "should get new" do
    get new_currentmedical_url
    assert_response :success
  end

  test "should create currentmedical" do
    assert_difference('Currentmedical.count') do
      post currentmedicals_url, params: { currentmedical: { allergies: @currentmedical.allergies, bloodPressure: @currentmedical.bloodPressure, dateCreated: @currentmedical.dateCreated, dateUpdated: @currentmedical.dateUpdated, height: @currentmedical.height, medications: @currentmedical.medications, symptoms: @currentmedical.symptoms, weight: @currentmedical.weight } }
    end

    assert_redirected_to currentmedical_url(Currentmedical.last)
  end

  test "should show currentmedical" do
    get currentmedical_url(@currentmedical)
    assert_response :success
  end

  test "should get edit" do
    get edit_currentmedical_url(@currentmedical)
    assert_response :success
  end

  test "should update currentmedical" do
    patch currentmedical_url(@currentmedical), params: { currentmedical: { allergies: @currentmedical.allergies, bloodPressure: @currentmedical.bloodPressure, dateCreated: @currentmedical.dateCreated, dateUpdated: @currentmedical.dateUpdated, height: @currentmedical.height, medications: @currentmedical.medications, symptoms: @currentmedical.symptoms, weight: @currentmedical.weight } }
    assert_redirected_to currentmedical_url(@currentmedical)
  end

  test "should destroy currentmedical" do
    assert_difference('Currentmedical.count', -1) do
      delete currentmedical_url(@currentmedical)
    end

    assert_redirected_to currentmedicals_url
  end
end
