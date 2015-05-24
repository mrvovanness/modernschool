class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end
  
  # Only teachers can create posts
  def create?
    user.has_role?(:teacher)
  end

  def update?
    user.id == post.user_id
  end
end
