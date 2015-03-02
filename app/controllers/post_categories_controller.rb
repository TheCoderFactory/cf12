class PostCategoriesController < ApplicationController
  before_action :set_post_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @post_categories = PostCategory.all
    respond_with(@post_categories)
  end

  def show
    respond_with(@post_category)
  end

  def new
    @post_category = PostCategory.new
    respond_with(@post_category)
  end

  def edit
  end

  def create
    @post_category = PostCategory.new(post_category_params)
    @post_category.save
    respond_with(@post_category)
  end

  def update
    @post_category.update(post_category_params)
    respond_with(@post_category)
  end

  def destroy
    @post_category.destroy
    respond_with(@post_category)
  end

  private
    def set_post_category
      @post_category = PostCategory.find(params[:id])
    end

    def post_category_params
      params.require(:post_category).permit(:name, :description, :icon)
    end
end
