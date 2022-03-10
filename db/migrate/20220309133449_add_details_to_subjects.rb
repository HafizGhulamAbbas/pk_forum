class AddDetailsToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :syllabus, :text
    add_column :subjects, :recbooks, :text
    add_column :subjects, :ppapers, :text
    add_column :subjects, :eremarks, :text
    add_column :subjects, :comments, :text
    add_column :subjects, :video, :text
    add_column :subjects, :books, :text
    add_column :subjects, :notes, :text
    add_column :subjects, :relinks, :text
    add_column :subjects, :mcqs, :text
  end
end
