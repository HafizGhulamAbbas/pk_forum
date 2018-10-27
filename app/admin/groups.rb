ActiveAdmin.register Group do
  menu parent: 'CSS'

  permit_params :name, :max_marks

  index do
    selectable_column
    id_column
    column :name
    column :max_marks
    actions
  end

  filter :name
  filter :max_marks

  form do |f|
    f.inputs do
      f.input :name
      f.input :max_marks
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :max_marks
    end
  end
end
