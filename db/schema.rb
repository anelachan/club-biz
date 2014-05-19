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

ActiveRecord::Schema.define(version: 20140519071518) do

  create_table "admin_data", force: true do |t|
    t.string   "position"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clubs", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "website_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin_id"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "location"
    t.text     "description"
    t.decimal  "ticket_price"
    t.integer  "initial_tickets_avail"
    t.text     "ticket_purchase_instructions"
    t.datetime "sales_start"
    t.datetime "sales_end"
    t.text     "conditions"
    t.string   "website_URL"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "club_id"
  end

  add_index "events", ["name"], name: "index_events_on_name"

  create_table "student_clubs", force: true do |t|
    t.integer  "student_id"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_clubs", ["club_id"], name: "index_student_clubs_on_club_id"
  add_index "student_clubs", ["student_id", "club_id"], name: "index_student_clubs_on_student_id_and_club_id", unique: true
  add_index "student_clubs", ["student_id"], name: "index_student_clubs_on_student_id"

  create_table "student_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
