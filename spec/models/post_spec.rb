require 'rails_helper'

describe Post do
  let!(:post) { create(:post) }
  it "renders html body" do
    post.update_attribute(:body_markdown, "### Hi, guys!")
    expect(post.body_html).to eq "<h3>Hi, guys!</h3>\n"
  end
end
