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

ActiveRecord::Schema.define(version: 4) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cuisines", force: true do |t|
    t.string   "cuisine_id"
    t.text     "cuisineName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "details", force: true do |t|
    t.string   "info_id"
    t.text     "promotion"
    t.string   "reservation"
    t.string   "originallink"
    t.string   "comment"
    t.string   "imgfolder"
    t.string   "urbanspoonlink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "restaurantName"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "postal"
    t.string   "imageUrl"
    t.string   "email"
    t.string   "phone"
    t.string   "operatinghour"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "info_id"
    t.string   "cuisine"
    t.datetime "modifieddate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userTransactions", force: true do |t|
    t.text     "transactionConfirmation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "user_firstName"
    t.string   "user_lastName"
    t.string   "user_email"
    t.string   "user_type"
    t.string   "user_password"
    t.datetime "userExpirationDate"
  end

end
