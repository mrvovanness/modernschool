require 'rails_helper'

describe Comment do
  let!(:comment) { create(:comment) }
  before(:each) do
    login("ex@mail.com", "bigsecret")
  end

  it "show" do
    visit lesson_path(comment.lesson)
    expect(page).to have_content "My agly comment"
  end
end
