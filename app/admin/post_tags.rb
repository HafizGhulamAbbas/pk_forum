ActiveAdmin.register PostTag do
  menu parent: 'Posts'

  permit_params :post_id, :tag_ids
end
