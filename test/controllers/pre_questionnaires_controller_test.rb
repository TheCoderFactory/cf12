require 'test_helper'

class PreQuestionnairesControllerTest < ActionController::TestCase
  setup do
    @pre_questionnaire = pre_questionnaires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pre_questionnaires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pre_questionnaire" do
    assert_difference('PreQuestionnaire.count') do
      post :create, pre_questionnaire: { age: @pre_questionnaire.age, background: @pre_questionnaire.background, experience: @pre_questionnaire.experience, gender: @pre_questionnaire.gender, hobbies: @pre_questionnaire.hobbies, name: @pre_questionnaire.name, order_id: @pre_questionnaire.order_id, reason: @pre_questionnaire.reason }
    end

    assert_redirected_to pre_questionnaire_path(assigns(:pre_questionnaire))
  end

  test "should show pre_questionnaire" do
    get :show, id: @pre_questionnaire
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pre_questionnaire
    assert_response :success
  end

  test "should update pre_questionnaire" do
    patch :update, id: @pre_questionnaire, pre_questionnaire: { age: @pre_questionnaire.age, background: @pre_questionnaire.background, experience: @pre_questionnaire.experience, gender: @pre_questionnaire.gender, hobbies: @pre_questionnaire.hobbies, name: @pre_questionnaire.name, order_id: @pre_questionnaire.order_id, reason: @pre_questionnaire.reason }
    assert_redirected_to pre_questionnaire_path(assigns(:pre_questionnaire))
  end

  test "should destroy pre_questionnaire" do
    assert_difference('PreQuestionnaire.count', -1) do
      delete :destroy, id: @pre_questionnaire
    end

    assert_redirected_to pre_questionnaires_path
  end
end
