class LessonPolicy
  attr_reader :user, :lesson

  def initialize(user, lesson)
    @user = user
    @lesson = lesson
  end
  
  # Only teachers can create lessons
  def create?
    user.has_role?(:teacher)
  end

  def update?
    user.id == lesson.course.user_id
  end
end
