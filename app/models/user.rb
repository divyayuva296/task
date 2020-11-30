class User < ApplicationRecord
	has_one_attached :image
	has_many :posts, dependent: :destroy
	has_many :comments , through: :posts
	has_many :likes , through: :posts
	has_many :active_relationships, class_name: "Relationship",foreign_key: "follower_id",dependent: :destroy   
	has_many :following, through: :active_relationships, source: :followed


has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
has_many :followers, through: :passive_relationships, source: :follower

has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
has_many :followers, through: :passive_relationships, source: :follower
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
has_many :followees, through: :followed_users

has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users


# acts_as_followable
# acts_as_follower
 # acts_as_target email: :email, email_allowed: :confirmed_at
 acts_as_target

# def follow(other_user)
#     following << other_user
#   end
 
#   # Unfollows a user.
#   def unfollow(other_user)
#     following.delete(other_user)
#   end
 
#   # Returns true if the current user is following the other user.
#   def following?(other_user)
#     following.include?(other_user)
#   end
end
