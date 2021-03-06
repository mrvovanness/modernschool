class Lesson < ActiveRecord::Base
  mount_uploader :video, VideoUploader

  belongs_to :course
  has_many :comments
  validates :title, :description, :course_id, presence: true
end
