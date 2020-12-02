class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(noti)
    # Do something later
    html = ApplicationController.render partial: "/notification/#{noti.notifiable_type.underscore.pluralize}/#{noti.action}", locals: {notification: noti}, formats: [:html]

   # html = ApplicationController.render partial: "/notification/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}, formats: [:html]
   # html = ApplicationController.render partial: "notification/notification", locals: {notification: notification}, formats: [:html]
   
    ActionCable.server.broadcast "notification:#{noti.recipient_id}", html: html
  end
  
end
