class NotificationController < ApplicationController
  def index
  	# @notifications = Notification.all.reverse
  	@notifications = Notification.where(recipient: current_user)
  
  
  end
end
