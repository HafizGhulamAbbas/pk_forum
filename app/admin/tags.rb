ActiveAdmin.register Tag do
  menu parent: 'Posts'

  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name_contains, label: 'Search by Tag Name'

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
    end
  end
end
