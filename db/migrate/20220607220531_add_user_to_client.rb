class AddUserToClient < ActiveRecord::Migration[7.0]
  def change
    add_reference :clients, :user, null: false, foreign_key: true, default: 1
    add_column :clients, :shared, :boolean, :null => false, :default => false
  end
end
