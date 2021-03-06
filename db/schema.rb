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

ActiveRecord::Schema.define(version: 20140626203046) do

  create_table "reservations", force: true do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "reservation_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "party_size"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "cuisine"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "capacity"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

end
