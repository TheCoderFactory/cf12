class FastTrackApplicationsController < ApplicationController
  before_action :set_fast_track_application, only: [:accept, :show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new, :create]
  invisible_captcha only: :create
  respond_to :html

  def accept
    @admission = Admission.create(fast_track_application_id: @fast_track_application.id, name: @fast_track_application.full_name, email: @fast_track_application.email)
    # if @admission.save(validation: false)
    # puts @admission.id.to_s
      AcceptanceMailerJob.new.async.perform(@admission.id)
    # else
    #   puts "Admission not saved"
    # end

    redirect_to fast_track_applications_path
  end

  def index
    @fast_track_applications = FastTrackApplication.all
    respond_with(@fast_track_applications)
  end

  def show
    respond_with(@fast_track_application)
  end

  def new
    if params[:scholarship]
      @scholarships = Scholarship.available
    end
    @fast_track_application = FastTrackApplication.new
    respond_with(@fast_track_application)
  end

  def edit
  end

  def create
    @fast_track_application = FastTrackApplication.new(fast_track_application_params)
    @fast_track_application.save
    if @fast_track_application.save
      FastTrackApplicationMailerJob.new.async.perform(@fast_track_application.id)
      redirect_to thanks_path
    else
      respond_with(@fast_track_application)
    end
  end

  def update
    @fast_track_application.update(fast_track_application_params)
    respond_with(@fast_track_application)
  end

  def destroy
    @fast_track_application.destroy
    respond_with(@fast_track_application)
  end

  private
    def set_fast_track_application
      @fast_track_application = FastTrackApplication.find(params[:id])
    end

    def fast_track_application_params
      params.require(:fast_track_application).permit(:phone, :first_name, :last_name, :city, :country, :email, :age, :gender, :one_line, :reason, :info, :passion, :experience, :challenge, :special, :links, :referral, :visa, :programme_choice, :scholarship_id)
    end
end
