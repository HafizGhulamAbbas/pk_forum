class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :user_id
      t.string :province
      t.string :department
      t.string :district
      t.date :opendate
      t.date :closedate
      t.string :url
      t.string :qualification
      t.string :salary
      t.string :eligibility
      t.string :description

      t.timestamps
    end
  end
end
