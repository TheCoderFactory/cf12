class BlogController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	@posts = Post.published_in_reverse_chron_order.paginate(:page => params[:page], :per_page => 10)
  	# @posts = Post.all.limit(10)
  	@popular_posts = Post.popular_posts.limit(3)
  	@post_categories = PostCategory.all
  	@tags = ActsAsTaggableOn::Tag.most_used(10)
  end

  def blog_filter
    @popular_posts = Post.popular_posts.limit(3)
    @post_categories = PostCategory.all
    @tags = ActsAsTaggableOn::Tag.most_used(10)
  	if params[:tag]
  		@posts = Post.tagged_with(params[:tag])
  	elsif params[:post_category]
      @posts = Post.where(post_category_id: params[:post_category])
    end
  end
end
