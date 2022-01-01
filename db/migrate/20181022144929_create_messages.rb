class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.boolean :status, :boolean, null: false, default: true
      t.references :visitor, foreign_key: true

      t.timestamps
    end
  end
end
