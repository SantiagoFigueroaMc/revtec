# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :licence_plate
      t.date :last_revision_date
      t.references :client, null: false, foreign_key: true
      t.timestamps
    end
  end
end
