class ExamPolicy
  attr_reader :user, :exam

  def initialize(user, exam)
    @user = user
    @exam = exam
  end

  # Only teachers can create exams
  def create?
    user.has_role?(:teacher)
  end

  def update?
    user.id == exam.user_id
  end
end
