class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :message
      t.boolean :status, default: true
      t.references :post, foreign_key: true
      t.references :visitor, foreign_key: true

      t.timestamps
    end
  end
end
