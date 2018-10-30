ActiveAdmin.register Comment do
  menu parent: 'Alerts'

  permit_params :message, :status, :post_id, :visitor_id

  index do
    selectable_column
    id_column
    column :message
    column :post
    column :visitor
    actions
  end
  
  filter :status

end
