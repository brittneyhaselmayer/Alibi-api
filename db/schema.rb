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

ActiveRecord::Schema.define(version: 2020_01_29_191751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alibis", force: :cascade do |t|
    t.string "when"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_alibis_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meetups", force: :cascade do |t|
    t.bigint "alibi_1_id", null: false
    t.bigint "alibi_2_id", null: false
    t.bigint "event_id", null: false
    t.string "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alibi_1_id"], name: "index_meetups_on_alibi_1_id"
    t.index ["alibi_2_id"], name: "index_meetups_on_alibi_2_id"
    t.index ["event_id"], name: "index_meetups_on_event_id"
  end

  create_table "pendings", force: :cascade do |t|
    t.bigint "alibi_1_id", null: false
    t.bigint "alibi_2_id", null: false
    t.bigint "event_id", null: false
    t.string "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alibi_1_id"], name: "index_pendings_on_alibi_1_id"
    t.index ["alibi_2_id"], name: "index_pendings_on_alibi_2_id"
    t.index ["event_id"], name: "index_pendings_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "alibis", "users"
  add_foreign_key "meetups", "alibis", column: "alibi_1_id"
  add_foreign_key "meetups", "alibis", column: "alibi_2_id"
  add_foreign_key "meetups", "events"
  add_foreign_key "pendings", "alibis", column: "alibi_1_id"
  add_foreign_key "pendings", "alibis", column: "alibi_2_id"
  add_foreign_key "pendings", "events"
end
