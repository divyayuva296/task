class PostsController < ApplicationController
	before_action :set_user , only: [:new,:create,:edit,:show,:destroy,:show,:update]
	before_action :set_post , only: [:show,:edit,:destroy,:update]

	def index
		@posts = Post.all
		# byebug
		# @post = Post.find(params[:id])
	end

	def new
		@post = @user.posts.new
	end

	def create
		@post = Post.create(post_params)
		if @post.save
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def edit
	end

	def show
	end

	def update
		if @post.update(post_params)
			redirect_to posts_path
		else
			render 'edit'
		end
	end

	def destroy
		if @post.destroy
			redirect_to posts_path
		end
	end

	private

	def post_params
		params.require(:post).permit(:post,:user_id)
	end

	def set_user
		@user = current_user
	end

	def set_post
		@post = Post.find(params[:id])
	end

	

end
