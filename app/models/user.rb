class User < ActiveRecord::Base
  # Include default devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :posts

  # Model methods
  def teacher?
    role == "teacher"
  end
end
