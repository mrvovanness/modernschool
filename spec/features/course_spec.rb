require 'rails_helper'

describe Course do
  let!(:course) { create(:course) }
  before(:each) do
    login("ex@mail.com", "bigsecret")
  end
  it "edit" do
    visit edit_course_path(course)
    expect(page).to have_content I18n.t('views.courses.edit')
  end

  it "edit only his/her own" do
    course.update_attribute(:user_id, 666)
    visit edit_course_path(course)
    expect(page).not_to have_content I18n.t('views.courses.edit')
  end

  it "create course" do
    course.user.add_role(:teacher)
    visit new_course_path
    fill_in I18n.t('simple_form.labels.course.title'), with: "Fallout"
    fill_in I18n.t('simple_form.labels.course.description'), with: "Super game"
    click_button I18n.t('helpers.submit.course.create')
    expect(page).to have_content "Fallout"
  end
end
