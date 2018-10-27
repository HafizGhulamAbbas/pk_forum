ActiveAdmin.register Moderator do
  menu parent: 'Users'

  permit_params :full_name, :user_name, :password_digest

  index do
    selectable_column
    id_column
    column :full_name
    column :user_name
    actions
  end

  filter :id_equals, label: 'Search by ID'
  filter :full_name
  filter :user_name

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :user_name
      f.input :password
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :full_name
      row :email
      row :created_at
      row :updated_at
    end
  end
end
