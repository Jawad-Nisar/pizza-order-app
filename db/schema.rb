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

ActiveRecord::Schema[7.1].define(version: 2024_02_28_115609) do
  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "topings_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topings_id"], name: "index_items_on_topings_id"
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "completed"
    t.string "promotion_code"
    t.string "discount_code"
    t.integer "items_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["items_id"], name: "index_orders_on_items_id"
  end

  create_table "topings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "topings", column: "topings_id"
  add_foreign_key "orders", "items", column: "items_id"
end