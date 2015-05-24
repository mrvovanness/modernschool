class Lesson < ActiveRecord::Base
  belongs_to :courses

  validates :title, :description, :course_id, presence: true
end
