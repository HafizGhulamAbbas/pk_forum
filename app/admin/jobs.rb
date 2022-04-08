ActiveAdmin.register Job do
    menu parent: 'Jobs'
  
    permit_params :title, :province, :department, :district, :opendate, :closedate, 
    :province, :url, :qualification, :salary, :eligibility, :description, :user_id
  
  
    index do
      selectable_column
      id_column
      column "Job Title", :title
      column :department
      column :province
      column :district
      column :qualification
      column "Advertisement Date", :opendate
      column "Last Date to Apply", :closedate
      column "Link to Apply", :url
      
      actions
    end
  
    filter :title_contains
    filter :closedate
    filter :closedate
    filter :province
    filter :department
    filter :salary
  
    form do |f|
      f.inputs do
        f.input :user_id, :as => :select, :collection => User.all.collect {|user| [user.full_name, user.id]}
        f.input :title, label: 'Job Title'
        f.input :description, as: :quill_editor
        f.input :department
        f.input :province
        f.input :district
        f.input :eligibility
        f.input :qualification
        f.input :opendate, label: "Advertisement Date"
        f.input :closedate, label: "Last Date to Apply"
        f.input :salary
        f.input :url


      end
      f.actions
    end
 
  end