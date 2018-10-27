class AddStatusToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :status, :boolean, null: false, default: false
  end
end
