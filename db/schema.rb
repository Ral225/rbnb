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

ActiveRecord::Schema[7.0].define(version: 2022_08_24_025043) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parking_slots", force: :cascade do |t|
    t.float "height"
    t.float "width"
    t.string "address"
    t.float "price"
    t.string "title"
    t.text "description"
    t.string "vehicle_type"
    t.string "weather_protection"
    t.string "security"
    t.string "currency"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parking_slots_on_user_id"
  end

  create_table "rental_requests", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "status", default: "Pending"
    t.float "total_amount"
    t.bigint "user_id", null: false
    t.bigint "parking_slot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parking_slot_id"], name: "index_rental_requests_on_parking_slot_id"
    t.index ["user_id"], name: "index_rental_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "parking_slots", "users"
  add_foreign_key "rental_requests", "parking_slots"
  add_foreign_key "rental_requests", "users"
end
