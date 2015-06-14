ActiveAdmin.register User do

  index do
    selectable_column
    column :email
    actions
  end
end
