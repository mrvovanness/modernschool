class Comment < ActiveRecord::Base
  belongs_to :lesson
  validates :body, :lesson_id, presence: true

  scope :for_lesson, ->(lesson_id) { where(lesson_id: lesson_id).all.order(created_at: :desc) }
end
