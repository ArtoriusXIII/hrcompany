require 'test_helper'

class RegionCompensationsControllerTest < ActionController::TestCase
  setup do
    @region_compensation = region_compensations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:region_compensations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create region_compensation" do
    assert_difference('RegionCompensation.count') do
      post :create, region_compensation: { country_name: @region_compensation.country_name, number_of_employees: @region_compensation.number_of_employees, region_name: @region_compensation.region_name, salary_total: @region_compensation.salary_total, state: @region_compensation.state }
    end

    assert_redirected_to region_compensation_path(assigns(:region_compensation))
  end

  test "should show region_compensation" do
    get :show, id: @region_compensation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @region_compensation
    assert_response :success
  end

  test "should update region_compensation" do
    patch :update, id: @region_compensation, region_compensation: { country_name: @region_compensation.country_name, number_of_employees: @region_compensation.number_of_employees, region_name: @region_compensation.region_name, salary_total: @region_compensation.salary_total, state: @region_compensation.state }
    assert_redirected_to region_compensation_path(assigns(:region_compensation))
  end

  test "should destroy region_compensation" do
    assert_difference('RegionCompensation.count', -1) do
      delete :destroy, id: @region_compensation
    end

    assert_redirected_to region_compensations_path
  end
end
