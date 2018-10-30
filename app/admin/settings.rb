ActiveAdmin.register Setting do
  permit_params :site_name, :post_per_page, :under_maintenance, :prevent_commenting, :tag_visibility

  index do
    selectable_column
    id_column
    column :site_name
    column :post_per_page
    column :under_maintenance
    column :prevent_commenting
    column :tag_visibility
    actions
  end

  filter :site_name_contains
  filter :post_per_page_equals
  filter :under_maintenance
  filter :prevent_commenting
  filter :tag_visibility
end
