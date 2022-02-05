ActiveAdmin.register User do
  menu parent: 'Users'
  permit_params :first_name, :last_name, :email, :password, :password_confirmation, :phone, role_ids: []

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password if f.object.new_record?
      f.input :password_confirmation if f.object.new_record?
      f.input :phone
      f.input :roles, as: :check_boxes
    end
    f.actions
  end

end
