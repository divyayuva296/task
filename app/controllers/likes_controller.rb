class LikesController < ApplicationController
	before_action :find_post
	before_action :find_like, only: [:destroy]
  def create
  	if already_liked?
  		flash[:notie] = "You can't like more than once"
  	else
    	@post.likes.create(user_id: current_user.id)
    end
    # redirect_to post_path(@post)
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {render 'posts/show.js.erb'}
    end
    # redirect_to root_path
  end

  def destroy
  if !(already_liked?)
    flash[:notice] = "Cannot unlike"
  else
    @like.destroy
  end
  # redirect_to post_path(@post)
  redirect_to root_path
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
