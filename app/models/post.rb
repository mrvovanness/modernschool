class Post < ActiveRecord::Base
  include RichFormatting

  belongs_to :teacher, class_name: "User"
  validates :title, :body_html, :body_markdown, :user_id, presence: true 

  formatted_fields body_html: :body_markdown

end
