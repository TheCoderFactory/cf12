require 'test_helper'

class AdmissionsControllerTest < ActionController::TestCase
  setup do
    @admission = admissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admission" do
    assert_difference('Admission.count') do
      post :create, admission: { accommodation: @admission.accommodation, agreement: @admission.agreement, city: @admission.city, country: @admission.country, email: @admission.email, fast_track_application_id: @admission.fast_track_application_id, laptop: @admission.laptop, name: @admission.name, payment_plan: @admission.payment_plan, phone: @admission.phone, postcode: @admission.postcode, programme: @admission.programme, scholarship: @admission.scholarship, state: @admission.state, street_address: @admission.street_address }
    end

    assert_redirected_to admission_path(assigns(:admission))
  end

  test "should show admission" do
    get :show, id: @admission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admission
    assert_response :success
  end

  test "should update admission" do
    patch :update, id: @admission, admission: { accommodation: @admission.accommodation, agreement: @admission.agreement, city: @admission.city, country: @admission.country, email: @admission.email, fast_track_application_id: @admission.fast_track_application_id, laptop: @admission.laptop, name: @admission.name, payment_plan: @admission.payment_plan, phone: @admission.phone, postcode: @admission.postcode, programme: @admission.programme, scholarship: @admission.scholarship, state: @admission.state, street_address: @admission.street_address }
    assert_redirected_to admission_path(assigns(:admission))
  end

  test "should destroy admission" do
    assert_difference('Admission.count', -1) do
      delete :destroy, id: @admission
    end

    assert_redirected_to admissions_path
  end
end
