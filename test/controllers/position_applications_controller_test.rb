require 'test_helper'

class PositionApplicationsControllerTest < ActionController::TestCase
  setup do
    @position_application = position_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:position_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create position_application" do
    assert_difference('PositionApplication.count') do
      post :create, position_application: { email: @position_application.email, experience: @position_application.experience, github: @position_application.github, linkedin: @position_application.linkedin, name: @position_application.name, phone: @position_application.phone, position: @position_application.position, reason: @position_application.reason, special: @position_application.special }
    end

    assert_redirected_to position_application_path(assigns(:position_application))
  end

  test "should show position_application" do
    get :show, id: @position_application
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @position_application
    assert_response :success
  end

  test "should update position_application" do
    patch :update, id: @position_application, position_application: { email: @position_application.email, experience: @position_application.experience, github: @position_application.github, linkedin: @position_application.linkedin, name: @position_application.name, phone: @position_application.phone, position: @position_application.position, reason: @position_application.reason, special: @position_application.special }
    assert_redirected_to position_application_path(assigns(:position_application))
  end

  test "should destroy position_application" do
    assert_difference('PositionApplication.count', -1) do
      delete :destroy, id: @position_application
    end

    assert_redirected_to position_applications_path
  end
end
