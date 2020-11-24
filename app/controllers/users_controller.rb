class UsersController < ApplicationController
	# 
	def show
		@user = User.find(params[:id])
	end

	def following
    	@title = "Following"
    	@user = User.find(params[:id])
    	@users = @user.followed_users
    	#.paginate(page: params[:page])
    	redirect_to user_path
  	end

  	def followers
    	@title = "Followers"
    	@user = User.find(params[:id])
    	@users = @user.followers
    	byebug
    	# render 'show_follow'
    	redirect_to user_path
  	end

end
