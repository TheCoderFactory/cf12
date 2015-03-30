class ScholarshipsController < ApplicationController
  before_action :set_scholarship, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @scholarships = Scholarship.all
    respond_with(@scholarships)
  end

  def show
    respond_with(@scholarship)
  end

  def new
    @scholarship = Scholarship.new
    respond_with(@scholarship)
  end

  def edit
  end

  def create
    @scholarship = Scholarship.new(scholarship_params)
    @scholarship.save
    respond_with(@scholarship)
  end

  def update
    @scholarship.update(scholarship_params)
    respond_with(@scholarship)
  end

  def destroy
    @scholarship.destroy
    respond_with(@scholarship)
  end

  private
    def set_scholarship
      @scholarship = Scholarship.find(params[:id])
    end

    def scholarship_params
      params.require(:scholarship).permit(:close_date, :announce_date,:website, :scholarship_type, :company, :logo, :available, :description)
    end
end
