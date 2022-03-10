ActiveAdmin.register Post do
  menu parent: 'Posts'

  permit_params :title, :content, :publish, :moderator_id, :subject_id, tag_ids: []

  member_action :upload, method: [:post] do
    result = { success: resource.images.attach(params[:file_upload]) }
    result[:url] = url_for(resource.images.last) if result[:success]
    render json: result
  end

  index do
    selectable_column
    id_column
    column :image
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
      f.input :images, as: :file, required: false
      f.input :content, as: :quill_editor
      unless object.new_record?
        plugin_opts = { image_uploader: { server_url: upload_admin_post_path(object.id), field_name: 'file_upload' } }
        f.input :content, as: :quill_editor
      end
      f.input :moderator_id, :as => :select, :collection => Moderator.all.collect {|moderator| [moderator.full_name, moderator.id]}
      f.input :subject_id, :as => :select, :collection => Subject.all.collect {|subject| [subject.name, subject.id]}
      f.input :tag_ids, label: 'Tags', :as => :select, :collection => Tag.all.collect {|tag| [tag.name, tag.id]}, multiple: true
      f.input :publish
    end
    f.actions
  end

  show do
    attributes_table do
      row :images
      row :id
      row :title
      row :content
      row 'Tags'  do |post|
        post.tags.map {|name| name.name }
      end
      row :publish
      row :created_at
      row :updated_at
      row :images do |resurce|
        resurce.images.each do |image|
          div do
            link_to image.filename, image, target: '_blank', rel: 'noopener'
          end
        end
        nil
      end
    end
  end
end