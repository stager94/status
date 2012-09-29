class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

	has_attached_file :avatar
	attr_accessible :avatar, :email, :username, :admin, :password, :password_confirmation, :remember_me, :role
  validates :username, :uniqueness => true
  has_many :quotes
  validates :username, :uniqueness => true
end
