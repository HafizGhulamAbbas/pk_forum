ActiveAdmin.register Post do
  menu parent: 'Posts'

  permit_params :title, :content, :publish, :moderator_id, :subject_id, tag_ids: []

  index do
    selectable_column
    id_column
    column :title
    column :content do |post_content|
      truncate(post_content.content, length: 80)
    end
    column :publish
    column 'Tags'  do |post|
      post.tags.map {|name| name.name }
    end
    actions
  end

  filter :title_contains
  filter :tag

  form do |f|
    f.inputs do
      f.input :title
      f.input :content, as: :quill_editor
      f.input :moderator_id, :as => :select, :collection => Moderator.all.collect {|moderator| [moderator.full_name, moderator.id]}
      f.input :subject_id, :as => :select, :collection => Subject.all.collect {|subject| [subject.name, subject.id]}
      f.input :tag_ids, label: 'Tags', :as => :select, :collection => Tag.all.collect {|tag| [tag.name, tag.id]}, multiple: true
      f.input :publish
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :content
      row 'Tags'  do |post|
        post.tags.map {|name| name.name }
      end
      row :publish
      row :created_at
      row :updated_at
    end
  end
end







































#
# ActiveAdmin.register Post do
#   menu parent: 'Posts'
#
#   permit_params :title, :content, :publish, :moderator_id, :subject_id, :tags,
#                 tags_attributes: [:id, :name]
#
#   index do
#     selectable_column
#     id_column
#     column :title
#     column :content
#     column :publish
#     column :tag_name
#     actions
#   end
#
#   filter :title_contains
#   filter :tag
#
#   form do |f|
#     f.inputs do
#       f.input :title
#       f.input :content
#       f.input :moderator_id, :as => :select, :collection => Moderator.all.collect {|moderator| [moderator.full_name, moderator.id]}
#       f.input :subject_id, :as => :select, :collection => Subject.all.collect {|subject| [subject.name, subject.id]}
#       f.has_many :tags, heading: 'Add Tags to Post' do |i|
#         i.input :name
#       end
#       f.input :publish
#     end
#     f.actions
#   end
#
#   show do
#     attributes_table do
#       row :id
#       row :title
#       row :content
#       row :tag_name
#       row :publish
#       row :created_at
#       row :updated_at
#     end
#   end
# end
