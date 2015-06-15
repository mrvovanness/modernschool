ActiveAdmin.register User do

  index do
    selectable_column
    column :email
    actions defaults: false do |user|
      item "Удалить", admin_user_path(user),
        method: :delete, data: { confirm: "Are you sure?" }
    end
  end
end
