ActiveAdmin.register Course do

  index do
    selectable_column
    column :title
    actions
  end

  permit_params :title, :description, :user_id
end
