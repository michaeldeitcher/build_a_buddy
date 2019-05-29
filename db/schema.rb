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

ActiveRecord::Schema.define(version: 2019_05_29_160705) do

  create_table "accessories", force: :cascade do |t|
    t.string "description"
    t.string "size"
    t.integer "cost"
    t.integer "sale_price"
    t.integer "inventory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accessories_purchase_orders", force: :cascade do |t|
    t.integer "accessory_id"
    t.integer "purchase_order_id"
    t.index ["accessory_id"], name: "index_accessories_purchase_orders_on_accessory_id"
    t.index ["purchase_order_id"], name: "index_accessories_purchase_orders_on_purchase_order_id"
  end

  create_table "accessories_stuffed_animals", force: :cascade do |t|
    t.integer "accessory_id"
    t.integer "stuffed_animal_id"
    t.index ["accessory_id"], name: "index_accessories_stuffed_animals_on_accessory_id"
    t.index ["stuffed_animal_id"], name: "index_accessories_stuffed_animals_on_stuffed_animal_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.datetime "purchased_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_orders_stuffed_animals", force: :cascade do |t|
    t.integer "purchase_order_id"
    t.integer "stuffed_animal_id"
    t.index ["purchase_order_id"], name: "index_purchase_orders_stuffed_animals_on_purchase_order_id"
    t.index ["stuffed_animal_id"], name: "index_purchase_orders_stuffed_animals_on_stuffed_animal_id"
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
