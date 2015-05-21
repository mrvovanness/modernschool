class SyntaxHighlighter < Redcarpet::Render::HTML
  
  # Rewrite block_code for 'pygmentize'
  def block_code(code, language)
    requre 'pygmentize'
    Pygmentize.proccess(code, language)
  end
end
