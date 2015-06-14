ActiveAdmin.register Lesson do

  index do
    selectable_column
    column :title
    actions
  end

  permit_params :title, :description, :course_id
end
