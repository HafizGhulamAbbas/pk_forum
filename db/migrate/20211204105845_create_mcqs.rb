class CreateMcqs < ActiveRecord::Migration[5.2]
  def change
    create_table :mcqs do |t|
      t.string :subject
      t.string :question
      t.string :optionA
      t.string :optionB
      t.string :optionC
      t.string :optionD
      t.string :optionE
      t.string :correctOption
      t.string :moreInfo

      t.timestamps
    end
  end
end
