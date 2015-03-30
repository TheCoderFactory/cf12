class AdmissionsController < ApplicationController
  before_action :set_admission, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:edit, :update]
  respond_to :html

  def index
    @admissions = Admission.all
    respond_with(@admissions)
  end

  def show
    respond_with(@admission)
  end

  def new
    @admission = Admission.new
    respond_with(@admission)
  end

  def edit
    @ft_application = @admission.fast_track_application
  end

  def create
    @admission = Admission.new(admission_params)
    @admission.save
    respond_with(@admission)
  end

  def update
    @ft_application = @admission.fast_track_application
    if @admission.update(admission_params)
      redirect_to thanks_path
    else
      respond_with(@admission)
    end
  end

  def destroy
    @admission.destroy
    respond_with(@admission)
  end

  private
    def set_admission
      @admission = Admission.find(params[:id])
    end

    def admission_params
      params.require(:admission).permit(:fast_track_application_id, :name, :email, :phone, :street_address, :city, :postcode, :state, :country, :programme, :scholarship, :laptop, :payment_plan, :accommodation, :agreement)
    end
end
