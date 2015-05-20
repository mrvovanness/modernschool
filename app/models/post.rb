# Libraries for markdown
require 'redcarpet'
require 'syntax_highlighter'

class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, :body, :user_id, presence: true 
end
