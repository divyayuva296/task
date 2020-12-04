class NotificationRelayJob < ApplicationJob
	# self.queue_adapter = :resque
	 # include Sidekiq::Worker

  queue_as :default

  def perform(notification)
  	# binding.pry
    # Do something later
    # binding.pry
    html = ApplicationController.render partial: "/notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}, formats: [:html]
    # (users.uniq - [notification.user_id]).each do |user|
   # binding.pry
   	ActionCable.server.broadcast "notification:#{notification.user_id}", {html: html}
	
  
  end
  
end
