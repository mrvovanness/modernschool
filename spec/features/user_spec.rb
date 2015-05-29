require 'rails_helper'

describe User do
  let!(:user) { create(:user) }
  before(:each) do
    login("ex@mail.com", "bigsecret")
  end

  context "Student" do
    before(:each) { user.add_role(:student) }

    it "login" do
      expect(page).to have_content  I18n.t('views.posts.news_feed')
    end

    it "only login(without adding of modifying content)" do
      visit new_post_path
      expect(page).not_to have_content I18n.t('navbar.add_news')
    end
  end

  context "Teacher" do
    before(:each) { user.add_role(:teacher) }

    it "adding content" do
      visit new_post_path
      expect(page).to have_content I18n.t('navbar.add_news')
    end
  end
end
