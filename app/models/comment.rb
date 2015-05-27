class Comment < ActiveRecord::Base
  belongs_to :lesson
  validates :commenter_name, :body, :lesson_id, presence: true
end
