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

acts_as_followable
acts_as_follower

def follow(other_user)
    following << other_user
  end
 
  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end
 
  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
end
