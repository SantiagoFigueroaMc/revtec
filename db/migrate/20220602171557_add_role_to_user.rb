class AddRoleToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :roles, :users, index: true
  end
end
