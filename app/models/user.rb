class User < ActiveRecord::Base
  scope :online, where("last_requested_at > ?", 15.minutes.ago).where("online = true").order("random()").limit(6)
  scope :list, order("created_at DESC")

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

	has_attached_file :avatar, :styles => { :original => "200x200#", :thumb => "50x50#", :small => "100x100#"}
	attr_accessible :avatar, :email, :username, :admin, :password, :password_confirmation, :remember_me, :role, :country, :vk, :last_requested_at, :last_name, :first_name, :online, :sex
  validates :username, :uniqueness => true
  has_many :quotes, dependent: :destroy
  validates :username, :uniqueness => true

  validates :username, :length => {:minimum => 3, :maximum => 10}
  validates :username, :format => { :with => /\A[a-zA-Z1-9_-]+\z/}
  def timeout_in
      15.minutes
  end
end