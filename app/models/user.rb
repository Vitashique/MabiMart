class User < ApplicationRecord
  include ActionView::Helpers::DateHelper
  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter
  has_friendship
  validates :email, presence: true
  validates_formatting_of :email, using: :email, allow_blank: true
  validates :password, presence: true, on: :create
  validates_length_of :password, in: 8..120, allow_blank: true

  after_create :confirm_user

  def self.from_omniauth(auth, role)
    img = ""
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.type = role
      user.oauth_pass_set = false
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      if auth.info.image?
        if auth.provider == 'facebook' # facebook needs to be accessed using https as this url is a redirect
          x = auth.info.image.sub!(/http/,'https')
          img = URI.parse(x).open
        else
          img = URI.parse(auth.info.image).open #this assumes the item is private or something if you try to call it using the https change and wont let you open the image.
        end
      end
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = 'DefaultPassword'
      user.skip_confirmation!
      user.save!
      user.avatar.update(image: img)
    end
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def pending_sent_at(sent_to)
    time_ago_in_words(HasFriendship::Friendship.find_by(friendable_id: sent_to,
    friend_id: id, status: "requested").created_at) + " ago"
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.downcase}]).first
    else
      where(conditions).first
    end
  end

  devise authentication_keys: [:login]

  private

  def confirm_user
    self.confirm
  end

  def set_avatar
    unless Avatar.exists?(user_id: id)
      Avatar.create!(user_id: id)
    end
  end
end
