# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_526_161_941) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.string 'street'
    t.string 'city'
    t.string 'state'
    t.string 'number'
    t.string 'details'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'client_id', null: false
    t.index ['client_id'], name: 'index_addresses_on_client_id'
  end

  create_table 'cars', force: :cascade do |t|
    t.string 'licence_plate'
    t.date 'last_revision_date'
    t.bigint 'client_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['client_id'], name: 'index_cars_on_client_id'
  end

  create_table 'clients', force: :cascade do |t|
    t.string 'name'
    t.string 'phone'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'addresses', 'clients'
  add_foreign_key 'cars', 'clients'
end
