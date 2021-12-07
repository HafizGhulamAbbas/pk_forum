ActiveAdmin.register Mcq do
  # menu parent: 'MCQs'

  permit_params :subject, :question, :optionA, :optionB, :optionC, :optionD, :optionE, :correctOption, :moreInfo

  filter :subject, label: 'Enter subject to search'

  index do
    selectable_column
    # index_column 
    id_column
    column "Question", sortable: :question do |mcq|
      link_to mcq.question, admin_mcq_path(mcq)
    end
    column "Subject", :subject
    column "Option A", :optionA, sortable: false
    column "Option B", :optionB, sortable: false
    column "Option C", :optionC, sortable: false
    column "Option D", :optionD, sortable: false
    column "Option E", :optionE, sortable: false
    column "Correct Option", :correctOption, sortable: false
    column "More Info", :moreInfo, sortable: false
    
    actions
  end
    
  #   # Actions as dropdown
  #   # actions dropdown: true do |mcq|
  #   #   item "Preview", admin_mcq_path(mcq)
  #   # end

  #   # Action with custom html via arbre
  #   # actions do |mcq|
  #   #   a "View", href: admin_mcq_path(mcq)
  #   # end

  #   # Append custom links to the default links
  #   # actions defaults: false do |mcq|
  #   #   item "Preview", admin_mcq_path(mcq), class: "member_link"
  #   # end
  # end



  form title: 'Create New MCQ' do |f|
    f.inputs do
      f.input :subject, label: "Subject Category: ", :as => :select, :collection => ["GK", "Pakistan Current Affairs", "World Current Affairs", "Pakistan Study", "Islamic Studies", "Everyday Science", "English", "Math", "Computer", "Pedagogy", "Physics", "Chemistry", "Biology", "Urdu", "Finance", "HRM", "Marketing", "Accounting", "Auditing", "Electrical Engineering", "Civil Engineering", "Mechanical Engineering", "Chemical Engineering", "Software Engineering", "Medical", "Biochemistry", "Dental Materials", "General Anatomy", "Microbiology", "Oral Anatomy", "Oral Histology", "Oral Pathology and Medicine", "Phisiology", "Pharmacology", "Psychology", "Argiculture", "Economics", "Sociology", "Statistics", "English Literature", "Judiciary and Law"]
      # f.input :subject, label: "Select existing category", :collection => Mcq.all.map{ |mcq| [mcq.subject] }
      f.input :question, label: "Question: "
      f.input :optionA, label: "Option A: "
      f.input :optionB, label: "Option B: "
      f.input :optionC, label: "Option C: "
      f.input :optionD, label: "Option D: "
      f.input :optionE, label: "Option E (Optional): "
      f.input :correctOption, label: "Correct Option: "
      f.input :moreInfo, label: "More Information (Optional): "
    end
    f.actions
  end
end