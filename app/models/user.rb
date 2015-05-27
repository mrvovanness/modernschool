class User < ActiveRecord::Base

  mount_uploader :avatar, AvatarUploader
  # Devise authorization
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Roles for users (models/role.rb)
  rolify

  # Associations
  has_many :posts
  has_many :courses
  has_many :lessons, through: :courses
  has_many :exams
  has_many :comments

  # Scopes
  scope :all_teachers, -> { joins(:roles).where({"roles.name" => "teacher"}) }

  # Methods
  def full_name
    [first_name, second_name].join(' ')
  end
end
