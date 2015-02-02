require 'test_helper'

class ScholarshipsControllerTest < ActionController::TestCase
  setup do
    @scholarship = scholarships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scholarships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scholarship" do
    assert_difference('Scholarship.count') do
      post :create, scholarship: { available: @scholarship.available, company: @scholarship.company, description: @scholarship.description, logo: @scholarship.logo, scholarship_type: @scholarship.scholarship_type }
    end

    assert_redirected_to scholarship_path(assigns(:scholarship))
  end

  test "should show scholarship" do
    get :show, id: @scholarship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scholarship
    assert_response :success
  end

  test "should update scholarship" do
    patch :update, id: @scholarship, scholarship: { available: @scholarship.available, company: @scholarship.company, description: @scholarship.description, logo: @scholarship.logo, scholarship_type: @scholarship.scholarship_type }
    assert_redirected_to scholarship_path(assigns(:scholarship))
  end

  test "should destroy scholarship" do
    assert_difference('Scholarship.count', -1) do
      delete :destroy, id: @scholarship
    end

    assert_redirected_to scholarships_path
  end
end