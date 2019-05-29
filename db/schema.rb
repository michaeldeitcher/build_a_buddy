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

ActiveRecord::Schema.define(version: 2019_05_29_054215) do

  create_table "accessories", force: :cascade do |t|
    t.string "description"
    t.string "size"
    t.integer "cost"
    t.integer "sale_price"
    t.integer "inventory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compatible_accessories", force: :cascade do |t|
    t.integer "stuffed_animal_id"
    t.integer "accessory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accessory_id"], name: "index_compatible_accessories_on_accessory_id"
    t.index ["stuffed_animal_id"], name: "index_compatible_accessories_on_stuffed_animal_id"
  end

  create_table "purchase_order_items", force: :cascade do |t|
    t.integer "purchase_order_id"
    t.integer "quantity"
    t.string "item_type"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_type", "item_id"], name: "index_purchase_order_items_on_item_type_and_item_id"
    t.index ["purchase_order_id"], name: "index_purchase_order_items_on_purchase_order_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.datetime "purchased_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stuffed_animals", force: :cascade do |t|
    t.string "description"
    t.string "size"
    t.integer "cost"
    t.integer "sale_price"
    t.integer "inventory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
