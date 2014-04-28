class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates :email, presence: true

  has_many :posts
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :wall_posts, through: :friends, source: :posts

  def self.named(name)
    where(name: name)
  end
end
