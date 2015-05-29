require 'rails_helper'

describe Post do
  let!(:post) { create(:post) }
  before(:each) do
    login("ex@mail.com", "bigsecret")
  end

  it "edit" do
    visit edit_post_path(post)
    expect(page).to have_content I18n.t('views.posts.edit')
  end

  it "edit only his/her own" do
    post.update_attribute(:user_id, 666)
    visit edit_post_path(post)
    expect(page).not_to have_content I18n.t('views.posts.edit')
  end
end
