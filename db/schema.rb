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

ActiveRecord::Schema[7.0].define(version: 2023_08_28_151103) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.bigint "service_provider_id", null: false
    t.bigint "dog_owner_id", null: false
    t.boolean "confirmed"
    t.float "booking_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_owner_id"], name: "index_bookings_on_dog_owner_id"
    t.index ["listing_id"], name: "index_bookings_on_listing_id"
    t.index ["service_provider_id"], name: "index_bookings_on_service_provider_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "listing_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_bookmarks_on_listing_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.integer "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_discounts_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "location"
    t.float "price"
    t.bigint "user_id", null: false
    t.string "image_url"
    t.integer "quantity_left"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "discount"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.text "comment"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
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
    t.string "company_name"
    t.integer "mobile"
    t.string "address"
    t.string "description"
    t.string "password"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "listings"
  add_foreign_key "bookings", "users", column: "dog_owner_id"
  add_foreign_key "bookings", "users", column: "service_provider_id"
  add_foreign_key "bookmarks", "listings"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "discounts", "listings"
  add_foreign_key "listings", "users"
  add_foreign_key "reviews", "bookings"
end
