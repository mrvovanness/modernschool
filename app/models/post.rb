class Post < ActiveRecord::Base
  include RichFormatting

  belongs_to :teacher, class_name: "User"
  validates :title, :body_markdown, :user_id, presence: true 

  # Markdown support (app/concern/rich_formatting.rb)
  formatted_fields body_html: :body_markdown

end
