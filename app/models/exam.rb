class Exam < ActiveRecord::Base
  belongs_to :user
  validates :title, :description, :date, :user_id, presence: true

  scope :upcoming, -> { where("date >= ?", DateTime.now - 1.day) }
end
