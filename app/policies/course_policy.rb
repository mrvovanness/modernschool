class CoursePolicy
  attr_reader :user, :course

  def initialize(user, course)
    @user = user
    @course = course
  end
  
  # Only teachers can create courses
  def create?
    user.has_role?(:teacher)
  end

  def update?
    user.id == course.user_id
  end
end
