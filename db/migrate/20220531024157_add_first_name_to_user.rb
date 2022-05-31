class AddFirstNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column("users", "first_name", :string, :null => false, :default => "")
    add_column("users", "last_name", :string, :null => false, :default => "")
    add_column("users", "phone", :string, :null => false, :default => "")
    add_column("users", "role", :string, :null => false, :default => "")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
