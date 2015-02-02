class CourseRegistrationsController < ApplicationController
  before_action :set_course_registration, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new, :create]
  invisible_captcha only: :create
  respond_to :html

  def index
    @course_registrations = CourseRegistration.all
    respond_with(@course_registrations)
  end

  def show
    respond_with(@course_registration)
  end

  def new
    @course_registration = CourseRegistration.new
    respond_with(@course_registration)
  end

  def edit
  end

  def create
    @course_registration = CourseRegistration.new(course_registration_params)
    if @course_registration.save
      RegistrationMailerJob.new.async.perform(@course_registration.id)
    end
    redirect_to thanks_path
  end

  def update
    @course_registration.update(course_registration_params)
    respond_with(@course_registration)
  end

  def destroy
    @course_registration.destroy
    respond_with(@course_registration)
  end

  private
    def set_course_registration
      @course_registration = CourseRegistration.find(params[:id])
    end

    def course_registration_params
      params.require(:course_registration).permit(:course_id, :first_name, :last_name, :city, :country, :reason, :bio, :email)
    end
end
