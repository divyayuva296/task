class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  after_create_commit {notification}

  private

  def notification
    users = User.all
    (users.uniq- [self.user]).each do |user|
      notification = Notification.create(recipient: self.user,user: user,action: "liked",notifiable: self)
      # NotificationRelayJob.set(wait: 10.seconds).perform_later(notification)
    end
  end
end
