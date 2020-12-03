# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_01_220901) do

  create_table "gift_items", force: :cascade do |t|
    t.integer "store_id"
    t.integer "gift_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "gift_type"
  end

  create_table "malls", force: :cascade do |t|
    t.string "name"
    t.string "location"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "store_type"
  end

end
