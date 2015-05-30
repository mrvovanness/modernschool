require 'rails_helper'

describe Exam do
  let!(:exam) { create(:exam) }
  before(:each) do
    login("ex@mail.com", "bigsecret")
    visit root_path
  end
  it "edit" do
    visit edit_exam_path(exam)
    expect(page).to have_content I18n.t('views.exams.edit')
  end

  it "edit only his/her own" do
    exam.update_attribute(:user_id, 666)
    visit edit_exam_path(exam)
    expect(page).not_to have_content I18n.t('views.exams.edit')
  end
end
