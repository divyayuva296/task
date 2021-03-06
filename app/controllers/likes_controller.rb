class LikesController < ApplicationController
	before_action :find_post
	before_action :find_like, only: [:destroy]

  def create
  	if already_liked?
  		flash[:notie] = "You can't like more than once"
  	else
    	@post.likes.create(user_id: current_user.id)
    end
    # ActionCable.server.broadcast "notification",post: @post.post
    # @noti = Notification.create(recipient: user, user: User.last, action: "followed",notifiable: @post.likes)
    # redirect_to post_path(@post)
    # byebug
    respond_to do |format|
      format.html { redirect_to request.referer }
      format.js {render 'likes/create.js.erb'}
    end
  end

  def destroy

    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else

      @like.destroy

    end
  # redirect_to post_path(@post)
  # redirect_to  post_path(@post)
    respond_to do |format|
      format.html { redirect_to request.referer} 
      format.js  {render 'likes/destroy.js.erb'}
    end
  end

  	private
  	def find_post
    	@post = Post.find(params[:post_id])
  	end

  	def already_liked?
  		Like.where(user_id: current_user.id, post_id:
  		params[:post_id]).exists?
		end

		def find_like
   	@like = @post.likes.find(params[:id])
		end



end
