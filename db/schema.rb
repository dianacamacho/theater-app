# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160321060834) do

  create_table "event_seats", force: :cascade do |t|
    t.string   "status",             limit: 255
    t.integer  "scheduled_event_id", limit: 4
    t.integer  "seat_id",            limit: 4
    t.integer  "user_id",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.text     "featured_performers", limit: 65535
    t.string   "event_type",          limit: 255
    t.integer  "venue_id",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description",         limit: 65535
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "hours",          limit: 255
    t.string   "phone",          limit: 255
    t.string   "website",        limit: 255
    t.string   "menu",           limit: 255
    t.string   "street_address", limit: 255
    t.string   "city",           limit: 255
    t.string   "state",          limit: 255
    t.string   "zip_code",       limit: 255
    t.string   "food_type",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id",       limit: 4
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "venue_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rows", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "number_seats", limit: 4
    t.integer  "venue_id",     limit: 4
    t.integer  "section_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "x_offset",     limit: 4
    t.integer  "y_offset",     limit: 4
  end

  create_table "scheduled_events", force: :cascade do |t|
    t.integer  "event_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "buy_ticket_link", limit: 255
    t.datetime "date_time"
    t.integer  "venue_id",        limit: 4
  end

  create_table "seat_photos", force: :cascade do |t|
    t.string   "image",         limit: 255
    t.string   "caption",       limit: 255
    t.boolean  "default_photo",             default: false
    t.integer  "user_id",       limit: 4
    t.integer  "seat_id",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sg_venue_id",   limit: 4
  end

  create_table "seats", force: :cascade do |t|
    t.string   "seat_section", limit: 255
    t.string   "seat_row",     limit: 255
    t.integer  "seat_number",  limit: 4
    t.integer  "venue_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sg_venue_id",  limit: 4
    t.integer  "row_id",       limit: 4
    t.integer  "section_id",   limit: 4
    t.integer  "x_offset",     limit: 4
    t.integer  "y_offset",     limit: 4
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "number_rows", limit: 4
    t.integer  "venue_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "x_offset",    limit: 4
    t.integer  "y_offset",    limit: 4
  end

  create_table "sg_db_venues", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "street_address", limit: 255
    t.string   "city_state",     limit: 255
    t.string   "city",           limit: 255
    t.string   "state",          limit: 255
    t.string   "zip_code",       limit: 255
    t.float    "latitude",       limit: 24
    t.float    "longitude",      limit: 24
    t.string   "phone",          limit: 255
    t.string   "website",        limit: 255
    t.text     "image",          limit: 65535
    t.integer  "sg_venue_id",    limit: 4
    t.integer  "user_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stage_height",   limit: 4
    t.integer  "stage_width",    limit: 4
    t.integer  "stage_x_offset", limit: 4
    t.integer  "stage_y_offset", limit: 4
    t.boolean  "seating_chart",                default: false
    t.string   "twitter_handle", limit: 255
  end

  create_table "sg_reviews", force: :cascade do |t|
    t.text     "content",        limit: 65535
    t.integer  "sg_db_venue_id", limit: 4
    t.integer  "sg_venue_id",    limit: 4
    t.integer  "user_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sg_rows", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "number_seats",   limit: 4
    t.integer  "sg_section_id",  limit: 4
    t.integer  "venue_id",       limit: 4
    t.integer  "sg_venue_id",    limit: 4
    t.integer  "sg_db_venue_id", limit: 4
    t.integer  "x_offset",       limit: 4
    t.integer  "y_offset",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sg_scheduled_events", force: :cascade do |t|
    t.integer  "sg_event_id",     limit: 4
    t.string   "buy_ticket_link", limit: 255
    t.integer  "sg_venue_id",     limit: 4
    t.datetime "date_time"
    t.datetime "date"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city_state",      limit: 255
    t.string   "street_address",  limit: 255
    t.string   "zip_code",        limit: 255
    t.string   "venue_name",      limit: 255
    t.string   "name",            limit: 255
    t.decimal  "lowest_price",                precision: 8, scale: 2
    t.decimal  "highest_price",               precision: 8, scale: 2
    t.decimal  "average_price",               precision: 8, scale: 2
  end

  create_table "sg_seat_photos", force: :cascade do |t|
    t.string   "image",         limit: 255
    t.string   "caption",       limit: 255
    t.boolean  "default_photo",             default: false
    t.integer  "user_id",       limit: 4
    t.integer  "sg_seat_id",    limit: 4
    t.integer  "sg_venue_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sg_seats", force: :cascade do |t|
    t.string   "seat_section",   limit: 255
    t.string   "seat_row",       limit: 255
    t.string   "seat_number",    limit: 255
    t.integer  "venue_id",       limit: 4
    t.integer  "sg_venue_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sg_db_venue_id", limit: 4
    t.integer  "sg_row_id",      limit: 4
    t.integer  "sg_section_id",  limit: 4
    t.integer  "x_offset",       limit: 4
    t.integer  "y_offset",       limit: 4
  end

  create_table "sg_sections", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "number_rows",    limit: 4
    t.integer  "venue_id",       limit: 4
    t.integer  "sg_venue_id",    limit: 4
    t.integer  "sg_db_venue_id", limit: 4
    t.integer  "x_offset",       limit: 4
    t.integer  "y_offset",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sg_venues", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "street_address",     limit: 255
    t.string   "zip_code",           limit: 255
    t.string   "latitude_longitude", limit: 255
    t.float    "latitude",           limit: 24
    t.float    "longitude",          limit: 24
    t.string   "phone",              limit: 255
    t.integer  "user_id",            limit: 4
    t.string   "website",            limit: 255
    t.text     "image",              limit: 65535
    t.integer  "sg_venue_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city_state",         limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "admin",                              default: false
    t.boolean  "vendor",                             default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "street_address",     limit: 255
    t.string   "city",               limit: 255
    t.string   "state",              limit: 255
    t.string   "zip_code",           limit: 255
    t.string   "latitude_longitude", limit: 255
    t.string   "phone",              limit: 255
    t.integer  "user_id",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website",            limit: 255
    t.text     "image",              limit: 65535
    t.integer  "sg_venue_id",        limit: 4
    t.float    "latitude",           limit: 24
    t.float    "longitude",          limit: 24
    t.string   "twitter_handle",     limit: 255
    t.integer  "stage_width",        limit: 4
    t.integer  "stage_height",       limit: 4
    t.integer  "stage_x_offset",     limit: 4
    t.integer  "stage_y_offset",     limit: 4
    t.boolean  "seating_chart",                    default: false
  end

end
