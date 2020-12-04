class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification:#{current_user.id}"

  end

  def unsubscribed
  	# stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end
  # def received(data)
  # 	puts "message"
  # # 	ActionCable.server.broadcast("notification",data)
  # end
end
