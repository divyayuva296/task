class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_rich_text :post
  # after_create_commit {notify_post}
  after_create_commit {notification}
  # after_create_commit {notify}

    


  private

  def notify
    
  	# Notification.create(notification: "new Notification")
  end
  def notify_post
  end
  def notification
    users = User.all
    (users.uniq- [self.user]).each do |user|
      notification = Notification.create(recipient: self.user,user: user,action: "posted",notifiable: self)
      # NotificationRelayJob.set(wait: 10.seconds).perform_later(notification)
    end
  end
end
