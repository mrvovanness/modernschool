class User < ActiveRecord::Base
  # Devise authorization
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Roles for users (models/role.rb)
  rolify

  # Associations
  has_many :posts
  has_many :courses
  has_many :lessons, through: :courses
end
