ActiveAdmin.register Course do

  index do
    selectable_column
    column :title
    actions
  end
end
