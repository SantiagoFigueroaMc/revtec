class AddClientToAddress < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :client, null: false, foreign_key: true
  end
end
