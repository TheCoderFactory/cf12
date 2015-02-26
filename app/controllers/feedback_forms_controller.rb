class FeedbackFormsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_feedback_form, except: [:index, :create, :new]

  respond_to :html

  def index
    @feedback_forms = FeedbackForm.all
    respond_with(@feedback_forms)
  end

  def show
    respond_with(@feedback_form)
  end

  def new
    @feedback_form = FeedbackForm.new
    @courses = Shoppe::Product.active.where(parent_id: nil).order(name: :asc)
    @locations = Shoppe::Location.order(name: :asc)
    respond_with(@feedback_form)
  end

  def edit
  end

  def create
    @feedback_form = FeedbackForm.new(feedback_form_params)
    @feedback_form.save
    redirect_to satisfaction_feedback_form_path(@feedback_form)
  end

  def update
    @feedback_form.update(feedback_form_params)
    redirect_to edit_feedback_form_path(@feedback_form)
  end

  def destroy
    @feedback_form.destroy
    respond_with(@feedback_form)
  end

  def satisfaction
  	@feedback_form.update_attributes(satisfaction: params[:score].to_i)
  	redirect_to edit_feedback_form_path(@feedback_form)
  end
  def value
  	@feedback_form.update_attributes(value: params[:score].to_i)
  	redirect_to edit_feedback_form_path(@feedback_form)
  end
  def achieve
  	@feedback_form.update_attributes(achieve: params[:score].to_i)
  	redirect_to edit_feedback_form_path(@feedback_form)
  end
  def another
  	@feedback_form.update_attributes(another: params[:score].to_i)
  	redirect_to edit_feedback_form_path(@feedback_form)
  end
  def recommend
  	@feedback_form.update_attributes(recommend: params[:score].to_i)
  	redirect_to edit_feedback_form_path(@feedback_form)
  end

  private
    def set_feedback_form
      @feedback_form = FeedbackForm.find(params[:id])
    end

    def feedback_form_params
      params.require(:feedback_form).permit(:course_id, :location_id, :satisfaction, :recommend, :another, :achieve, :value, :best_part, :comments)
    end
end
