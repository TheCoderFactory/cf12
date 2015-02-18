class TestimonialsController < ApplicationController
  before_action :set_testimonial, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @testimonials = Testimonial.all
    respond_with(@testimonials)
  end

  def show
    @product = Shoppe::Product.find(@testimonial.product_id)
    respond_with(@testimonial)
  end

  def new
    @testimonial = Testimonial.new
    respond_with(@testimonial)
  end

  def edit
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)
    @testimonial.save
    respond_with(@testimonial)
  end

  def update
    @testimonial.update(testimonial_params)
    respond_with(@testimonial)
  end

  def destroy
    @testimonial.destroy
    respond_with(@testimonial)
  end

  private
    def set_testimonial
      @testimonial = Testimonial.find(params[:id])
    end

    def testimonial_params
      params.require(:testimonial).permit(:product_id, :name, :one_line, :content, :image, :publish, :gender)
    end
end
