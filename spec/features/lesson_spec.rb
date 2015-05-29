require 'rails_helper'

describe Lesson do
  let!(:lesson) { create(:lesson) }
  before(:each) do
    login("ex@mail.com", "bigsecret")
    visit root_path
  end
  it "edit" do
    visit edit_lesson_path(lesson)
    expect(page).to have_content I18n.t('views.lessons.edit')
  end

  it "edit only his/her own" do
    lesson.course.update_attribute(:user_id, 666)
    visit edit_lesson_path(lesson)
    expect(page).not_to have_content I18n.t('views.lessons.edit')
  end
end
