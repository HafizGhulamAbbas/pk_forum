ActiveAdmin.register Job do
    menu parent: 'Jobs'
  
    permit_params :title, :province, :department, :district, :opendate, :closedate, 
    :province, :url, :qualification, :salary, :eligibility, :description, :user_id
  
  
    index do
      selectable_column
      id_column
      column :title
      column :province
      column :salary
      column :qualification
      column :closedate
      column :url
      
      actions
    end
  
    filter :title_contains
    filter :closedate
    filter :salary
  
 
  end