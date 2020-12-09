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
         :recoverable, :rememberable, :validatable,:omniauthable,omniauth_providers: [:google_oauth2,:linkedin]#, authentication_keys: [:login]

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  has_many :notifications, as: :recipient
  validates :username, presence: true, uniqueness: { case_sensitive: false }
   validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
   validate :validate_username


  attr_accessor :login

  def login
    @login || self.username || self.email
  end

   def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value OR lower(email) = :value",
      { value: login.strip.downcase}]).first
  end
  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.connect_to_linkedin(auth, signed_in_resource=nil) 
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user 
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user 
        return registered_user 
      else 
         user = User.create(username:auth.info.first_name, provider:auth.provider, uid:auth.uid, email:auth.info.email, password:Devise.friendly_token[0,20], 
      )
         byebug

      end 
    end 
  end
  # def self.from_omniauth(access_token,signed_in_resource=nil)
  #   data = access_token.info
  #   user = User.where(email: data['email']).first

  #   # Uncomment the section below if you want users to be created if they don't exist
  #   if !user
  #       user = User.create(username: data['name'],
  #          email: data['email'],
  #          password: Devise.friendly_token[0,20]
  #       )
  #   end
  #   user
  # end

  def self.from_omniauth(auth, signed_in_resource=nil)

    # data = auth.info
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(username: auth.info.first_name, provider: auth.provider, uid: auth.uid,email: auth.info.email,password: Devise.friendly_token[0,20])
      end
    end
  end

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data['name'],
    #        email: data['email'],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
  

    # where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
# acts_as_followable
# acts_as_follower
 # acts_as_target email: :email, email_allowed: :confirmed_at


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
