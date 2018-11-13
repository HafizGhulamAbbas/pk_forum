class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.integer :phone
      t.string :email
      t.string :city
      t.string :advertising_id
      t.string :udid
      t.integer :device_type

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
