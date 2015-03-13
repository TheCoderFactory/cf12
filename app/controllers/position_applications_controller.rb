class PositionApplicationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_position_application, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @position_applications = PositionApplication.all
    respond_with(@position_applications)
  end

  def show
    respond_with(@position_application)
  end

  def new
    @position_application = PositionApplication.new
    respond_with(@position_application)
  end

  def edit
  end

  def create
    @position_application = PositionApplication.new(position_application_params)
    @position_application.save
    respond_with(@position_application)
  end

  def update
    @position_application.update(position_application_params)
    respond_with(@position_application)
  end

  def destroy
    @position_application.destroy
    respond_with(@position_application)
  end

  private
    def set_position_application
      @position_application = PositionApplication.find(params[:id])
    end

    def position_application_params
      params.require(:position_application).permit(:name, :phone, :email, :linkedin, :github, :experience, :reason, :special, :position)
    end
end
