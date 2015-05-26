require 'rails_helper'

describe Lesson do
  let!(:lesson) { create(:lesson) }
  before(:each) do
    login("ex@mail.com", "bigsecret")
  end
  it "edit" do
    visit edit_lesson_path(lesson)
    expect(page).to have_content "Edit Lesson"
  end

  it "edit only his/her own" do
    lesson.update_attribute(:course_id, 666)
    visit edit_lesson_path(lesson)
    expect(page).not_to have_content "Edit News"
  end
end
