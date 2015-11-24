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

ActiveRecord::Schema.define(version: 20151118025855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stations", force: true do |t|
    t.string   "name"
    t.string   "cta_id"
    t.string   "direction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stop_id"
    t.string   "direction_id"
    t.string   "stop_name"
    t.string   "station_name"
    t.string   "station_descriptive_name"
    t.string   "map_id"
    t.string   "longitude"
    t.string   "latitude"
    t.integer  "group_id"
  end

  create_table "stops", force: true do |t|
    t.integer  "train_id"
    t.integer  "station_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trains", force: true do |t|
    t.string   "key"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cta_key"
  end

end
