ActiveAdmin.register Post do

  index do
    selectable_column
    column :title
    actions
  end

  permit_params :title, :body_markdown, :user_id
end
