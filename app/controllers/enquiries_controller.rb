class EnquiriesController < ApplicationController
  before_action :set_enquiry, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new, :create]
  respond_to :html
  invisible_captcha only: [:create], honeypot: :subtitle
  def index
    @enquiries = Enquiry.all
    respond_with(@enquiries)
  end

  def show
    respond_with(@enquiry)
  end

  def new
    @enquiry = Enquiry.new
    respond_with(@enquiry)
  end

  def edit
  end

  def create
    @enquiry = Enquiry.new(enquiry_params)
    if @enquiry.save
      EnquiryMailerJob.new.async.perform(@enquiry.id)
    end
    redirect_to :back
  end

  def update
    @enquiry.update(enquiry_params)
    respond_with(@enquiry)
  end

  def destroy
    @enquiry.destroy
    respond_with(@enquiry)
  end

  private
    def set_enquiry
      @enquiry = Enquiry.find(params[:id])
    end

    def enquiry_params
      params.require(:enquiry).permit(:name, :email, :content)
    end
end
