ActiveAdmin.register Subject do
  menu parent: 'CSS'

  permit_params :name, :marks, :compulsory, :code_no, :group_id

  index do
    selectable_column
    id_column
    column :name
    column :marks
    column :code_no
    column :compulsory
    actions
  end

  filter :group_id_equals, label: 'Search by Group Number'
  filter :name

  form do |f|
    f.inputs do
      f.input :name
      f.input :marks
      f.input :ppapers, as: :quill_editor
      f.input :syllabus, as: :quill_editor
      f.input :recbooks, as: :quill_editor
      f.input :eremarks, as: :quill_editor
      f.input :comments, as: :quill_editor
      f.input :video, as: :quill_editor
      f.input :books, as: :quill_editor
      f.input :notes, as: :quill_editor
      f.input :relinks, as: :quill_editor
      f.input :mcqs, as: :quill_editor
      f.input :code_no
      f.input :compulsory
      f.input :group_id, :as => :select, :collection => Group.all.collect {|group| [group.name, group.id]}
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :marks
      row :code_no
      row :compulsory
      row :group
    end
  end
end
