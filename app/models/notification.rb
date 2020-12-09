class Notification < ApplicationRecord
# attr_accessor :read_at
  belongs_to :user
  belongs_to :recipient, class_name: "User"
  belongs_to :notifiable, polymorphic: true
  after_create_commit -> {NotificationRelayJob.set(wait: 10.seconds).perform_later(self)}
	# byebug
	scope :unread, ->{ where(read_at: nil) }
  scope :recent, ->{ order(created_at: :desc).limit(5) }
end
