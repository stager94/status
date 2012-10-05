class User < ActiveRecord::Base
  scope :online, where("online = true and last_requested_at > ?", 15.minutes.ago)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

	has_attached_file :avatar
	attr_accessible :avatar, :email, :username, :admin, :password, :password_confirmation, :remember_me, :role, :country, :vk, :last_requested_at, :last_name, :first_name, :online
  validates :username, :uniqueness => true
  has_many :quotes, dependent: :destroy
  validates :username, :uniqueness => true

  def timeout_in
      15.minutes
  end
end