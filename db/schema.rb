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

ActiveRecord::Schema.define(version: 2018_11_01_051555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customer1s", force: :cascade do |t|
    t.string "name"
    t.date "dob"
    t.text "address"
    t.decimal "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.bigint "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
  end

  create_table "items", force: :cascade do |t|
    t.integer "serial_no"
    t.string "name"
    t.integer "cost"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer1_id"
    t.bigint "item_id"
    t.index ["customer1_id"], name: "index_orders_on_customer1_id"
    t.index ["item_id"], name: "index_orders_on_item_id"
  end

  add_foreign_key "orders", "customer1s"
  add_foreign_key "orders", "items"
end
