class HomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	@post = Post.new
  	# @user = User.find(3)
  	@posts = Post.all
  	@users = User.all
  	# @comment = @post.comments.new
  end
end
