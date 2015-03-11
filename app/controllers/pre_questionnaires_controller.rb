class PreQuestionnairesController < ApplicationController
  before_action :set_pre_questionnaire, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new, :create]
  
  respond_to :html

  def index
    @pre_questionnaires = PreQuestionnaire.all
    respond_with(@pre_questionnaires)
  end

  def show
    respond_with(@pre_questionnaire)
  end

  def new
    @pre_questionnaire = PreQuestionnaire.new
    @order = Shoppe::Order.find(params[:order])
    respond_with(@pre_questionnaire)
  end

  def edit
  end

  def create
    @pre_questionnaire = PreQuestionnaire.new(pre_questionnaire_params)
    if @pre_questionnaire.save
      redirect_to thanks_path
    else
      respond_with(@pre_questionnaire)
    end
  end

  def update
    @pre_questionnaire.update(pre_questionnaire_params)
    respond_with(@pre_questionnaire)
  end

  def destroy
    @pre_questionnaire.destroy
    respond_with(@pre_questionnaire)
  end

  private
    def set_pre_questionnaire
      @pre_questionnaire = PreQuestionnaire.find(params[:id])
    end

    def pre_questionnaire_params
      params.require(:pre_questionnaire).permit(:referral, :name, :gender, :age, :reason, :background, :experience, :hobbies, :order_id)
    end
end
