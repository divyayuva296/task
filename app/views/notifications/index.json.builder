json.array! @notifications do |notification|
	json.id notification.id
	json.unread !notification.read_at?
	json.template render partial: "notification/#{notification.notifiable_type.underscore.plurize}/#{notification.action}",locals: {notification: notification}, formats: [:html]
end