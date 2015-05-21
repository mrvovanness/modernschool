class SyntaxHighlighter < Redcarpet::Render::HTML
  
  # Rewrite block_code for 'pygmentize'
  def block_code(code, language)
    require 'pygmentize'
    Pygmentize.process(code, language)
  end
end
