# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  username           :string           not null
#  description        :text
#  email              :string           not null
#  password_digest    :string           not null
#  session_token      :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 30 },
                   format: { with: VALID_EMAIL_REGEX },
                   uniqueness: { case_sensitive: false }

  has_attached_file :image, default_url: "default_user.png", styles: {
     medium: '300x300>'
   }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  after_initialize :ensure_session_token , :ensure_image_url

  attr_reader :password


  # Associations

  has_many :projects,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Project,
    inverse_of: :author

  has_many :comments,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Comment,
    inverse_of: :author

  has_many :favorites
  has_many :favorite_projects,
    through: :favorites,
    source: :project

  has_many :in_follows,
  foreign_key: :followee_id,
  class_name: :Follow

  has_many :out_follows,
    foreign_key: :follower_id,
    class_name: :Follow

  has_many :followers,
    through: :in_follows,
    source: :follower

  has_many :followees,
  through: :out_follows,
  source: :followee


 # Authentication


  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    user && user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end


  def followed_user_ids
    @followed_user_ids ||= out_follows.pluck(:followee_id)
  end

  def follows?(user)
    followed_user_ids.include?(user.id)
  end

  private
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def ensure_image_url
    self.image.url.downcase!
  end

end
