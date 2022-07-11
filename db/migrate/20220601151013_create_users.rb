class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.references :role, null: false, foreign_key: true, default: 1

      t.timestamps
    end
  end
end
