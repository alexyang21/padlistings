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

ActiveRecord::Schema.define(version: 20141006013419) do

  create_table "images", force: true do |t|
    t.string   "url"
    t.integer  "pad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["pad_id"], name: "index_images_on_pad_id"

  create_table "keys", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pads", force: true do |t|
    t.string   "heading"
    t.text     "body"
    t.decimal  "price",        precision: 8, scale: 2
    t.string   "external_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "timestamp"
  end

end
