class NotificationController < ApplicationController
  def index
  	# @notifications = Notification.all.reverse
  	@notifications = Notification.where(user: current_user).recent
  	# @notifications = Notification.where(user: current_user)
  	# byebug
  end

  def read
  	# byebug
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end
end
