class CreateModerators < ActiveRecord::Migration[5.2]
  def change
    create_table :moderators do |t|
      t.string :full_name
      t.string :user_name
      t.string :password_digest

      t.timestamps
    end
  end
end
