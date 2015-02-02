class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :show

  respond_to :html

  def index
    @authors = Author.all
    respond_with(@authors)
  end

  def show
    @posts = @author.posts.published_in_reverse_chron_order.paginate(:page => params[:page], :per_page => 10)
    respond_with(@author)
  end

  def new
    @author = Author.new
    respond_with(@author)
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    @author.save
    respond_with(@author)
  end

  def update
    @author.update(author_params)
    respond_with(@author)
  end

  def destroy
    @author.destroy
    respond_with(@author)
  end

  private
    def set_author
      @author = Author.friendly.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name, :profile_picture, :slug, :google_plus, :linkedin, :twitter, :github, :website, :title, :info)
    end
end
