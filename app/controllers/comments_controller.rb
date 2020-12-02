class CommentsController < ApplicationController
	before_action :set_post, only: [:new,:create,:destroy,:edit,:update]
	before_action :set_user, only: [:new,:create,:destroy,:edit,:update]

	def new
	end

	def create
		@comment = @post.comments.create(comment_params)
		if @comment.save
			# redirect_to post_path(@post)
			# redirect_to root_path
			redirect_to params[:dashboardredirect].nil? ? root_path : post_path(@post)
		end
	end

	def edit
		# @comment = @post.comments.find(params[:id])
	end
	def show
		# @comment = @post.comments.find(params[:id])
	end

	def update
		@comment = @post.comments.find(params[:id])
		# @comment = @post.comments.update(comment_params)
		if @comment.update(comment_params)
			redirect_to post_path(@post)
		end
	end

	def destroy
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
	 
	private

	def comment_params
		params.require(:comment).permit(:comments,:post_id,:user_id)
	end

	def set_post
		@post = Post.find(params[:post_id])
	end

	def set_user
		@user = current_user
	end

end
