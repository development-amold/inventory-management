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

ActiveRecord::Schema.define(version: 2018_09_10_111452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.bigint "pick_id"
    t.bigint "strap_id"
    t.bigint "brand_id"
    t.string "name"
    t.decimal "unit_price", precision: 12, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "purchased_at"
    t.index ["brand_id"], name: "index_accessories_on_brand_id"
    t.index ["pick_id"], name: "index_accessories_on_pick_id"
    t.index ["strap_id"], name: "index_accessories_on_strap_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "guitar_id"
    t.bigint "accessory_id"
    t.integer "quantity"
    t.decimal "unit_price", precision: 12, scale: 3
    t.decimal "sub_total", precision: 12, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accessory_id"], name: "index_cart_items_on_accessory_id"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["guitar_id"], name: "index_cart_items_on_guitar_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id"
    t.decimal "total_price", precision: 12, scale: 3
    t.datetime "sold_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guitars", force: :cascade do |t|
    t.bigint "brand_id"
    t.bigint "category_id"
    t.string "name"
    t.decimal "unit_price", precision: 12, scale: 3
    t.integer "stringscount"
    t.datetime "purchased_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_guitars_on_brand_id"
    t.index ["category_id"], name: "index_guitars_on_category_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "guitar_id"
    t.bigint "accessory_id"
    t.decimal "total_price", precision: 15, scale: 3
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accessory_id"], name: "index_order_items_on_accessory_id"
    t.index ["guitar_id"], name: "index_order_items_on_guitar_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "picks", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_picks_on_category_id"
  end

  create_table "straps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accessories", "brands"
  add_foreign_key "accessories", "picks"
  add_foreign_key "accessories", "straps"
  add_foreign_key "cart_items", "accessories"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "guitars"
  add_foreign_key "carts", "users"
  add_foreign_key "guitars", "brands"
  add_foreign_key "guitars", "categories"
  add_foreign_key "order_items", "accessories"
  add_foreign_key "order_items", "guitars"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "picks", "categories"
end
