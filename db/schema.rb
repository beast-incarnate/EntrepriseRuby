# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170629145503) do

  create_table "client_host_mappings", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "host_id"
    t.integer  "item_id"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "quantity"
    t.string   "host_name"
    t.string   "client_name"
    t.string   "item_name"
  end

  add_index "client_host_mappings", ["client_id"], name: "index_client_host_mappings_on_client_id"
  add_index "client_host_mappings", ["host_id"], name: "index_client_host_mappings_on_host_id"
  add_index "client_host_mappings", ["item_id"], name: "index_client_host_mappings_on_item_id"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.integer  "contact"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "email"
    t.string   "password"
    t.string   "access_token"
  end

  create_table "hosts", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "email"
    t.string   "contact"
    t.string   "password"
    t.string   "access_token"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "host_id"
    t.string   "name"
    t.integer  "price"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items", ["host_id"], name: "index_items_on_host_id"

end
