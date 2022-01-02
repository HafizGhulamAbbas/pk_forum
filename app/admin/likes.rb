ActiveAdmin.register Like do
    menu parent: 'Alerts'
  
    permit_params :post_id, :user_id
  
    index do
      selectable_column
      id_column
      column :post
      actions
    end
      
  end
  