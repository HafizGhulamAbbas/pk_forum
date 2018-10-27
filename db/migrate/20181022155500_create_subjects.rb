class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :marks
      t.boolean :compulsory
      t.integer :code_no
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
