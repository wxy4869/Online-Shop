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

ActiveRecord::Schema[7.0].define(version: 2022_12_29_024518) do
  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_feature_id", null: false
    t.integer "num", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_feature_id"], name: "index_carts_on_product_feature_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "collects", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_feature_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_feature_id"], name: "index_collects_on_product_feature_id"
    t.index ["user_id"], name: "index_collects_on_user_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "product_feature_id", default: 0, null: false
    t.integer "num", default: 0, null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_details_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "real_name", default: "", null: false
    t.string "address", default: "", null: false
    t.string "telephone", default: "", null: false
    t.string "post_code", default: "", null: false
    t.integer "status", default: 0, null: false
    t.decimal "price", default: "0.0", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_features", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "url", default: "", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_features_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "detail"
    t.decimal "price", default: "0.0", null: false
    t.integer "sales", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.integer "status", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "carts", "product_features"
  add_foreign_key "carts", "users"
  add_foreign_key "collects", "product_features"
  add_foreign_key "collects", "users"
  add_foreign_key "order_details", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "product_features", "products"
end
