class UsersController < ApplicationController
	# 
	def show
		@user = User.find(params[:id])
    @users = User.all
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
 
    	# render 'show_follow'
    	redirect_to user_path
  	end

    def follow
      @user = User.find(params[:id])
      current_user.followees << @user
      respond_to do |format|
        format.html { redirect_to root_path(@user) }
        format.js {render 'users/follow.js.erb'}
      end
      # redirect_to suggestion_path(@user)
    end
    def unfollow
      @user = User.find(params[:id])
      current_user.followed_users.find_by(followee_id: @user.id).destroy
      # redirect_to suggestion_path(@user)
      respond_to do |format|
        format.html { redirect_to root_path(@user) }
        format.js {render 'users/follow.js.erb'}
      end
    end

end
