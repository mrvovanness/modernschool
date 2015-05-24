class Course < ActiveRecord::Base
  has_many :lessons
  belongs_to :user

  validates :title, :description, :user_id, presence: true
end
