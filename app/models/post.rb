class Post < ActiveRecord::Base
  include RichFormatting

  belongs_to :teacher, class_name: "User"
  validates :title, :body_markdown, :user_id, presence: true 

  mount_uploader :picture, PictureUploader
  mount_uploader :document, DocumentUploader

  # Markdown support (app/concern/rich_formatting.rb)
  formatted_fields body_html: :body_markdown

end
