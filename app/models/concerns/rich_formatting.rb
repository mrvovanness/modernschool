# Libraries for markdown in posts
require 'redcarpet'
require 'syntax_highlighter'

module RichFormatting
  extend ActiveSupport::Concern

  module ClassMethods
    # Argument is hash { body_html: body_markdown }
    def formatted_fields(fields)
      fields.each do |key, value|
        # Setter for body_markdown
        define_method "#{value}=" do |markdown_text|
          write_attribute(value, markdown_text)
          # Convert to body_html
          write_attribute(key, markdown_to_html(markdown_text))
        end
      end
      
    end
  end

  def markdown_to_html(markdown_text)
    renderer = SyntaxHighlighter # settings in app/services/
    extensions = { fenced_code_blocks: true, autolink: true }
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    redcarpet.render(markdown_text)
  end

end
