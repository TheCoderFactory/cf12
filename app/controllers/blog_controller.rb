class BlogController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	# @posts = Post.published_in_reverse_chron_order.paginate(:page => params[:page], :per_page => 10)
  	@posts = Post.all.limit(10)
  	@popular_posts = Post.popular_posts.limit(3)
  	@post_categories = PostCategory.all
  	@tags = ActsAsTaggableOn::Tag.most_used(10)
  end
end
