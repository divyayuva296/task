class HomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	@post = Post.new
  	# @user = User.find(3)
  	@posts = Post.all
  	@users = User.all
  	 # @post1 = Post.order(id: :asc).offset(params[:index]).limit(1)
# byebug
  	# @post = Post.find(params[:post_id])
  	# @comment = @post.comments.new
  	@comment = Comment.new
    @notifications = Notification.where(user: current_user).recent
  end

  def suggestion
  	@users = User.all
  end

end
