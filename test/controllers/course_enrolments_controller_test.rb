require 'test_helper'

class CourseEnrolmentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
