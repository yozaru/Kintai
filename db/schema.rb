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

ActiveRecord::Schema.define(version: 20150519025527) do

  create_table "archive", force: :cascade do |t|
    t.string  "employee_id", limit: 45
    t.string  "name",        limit: 45
    t.string  "sex",         limit: 45
    t.string  "project",     limit: 45
    t.integer "month",       limit: 4
    t.string  "worktime",    limit: 45
  end

  create_table "kakos", force: :cascade do |t|
    t.string   "employee_id", limit: 255
    t.string   "name",        limit: 255
    t.string   "sex",         limit: 255
    t.string   "project",     limit: 255
    t.string   "job",         limit: 255
    t.integer  "month",       limit: 4
    t.integer  "worktime",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "kintais", force: :cascade do |t|
    t.string  "employee_id", limit: 255
    t.string  "name",        limit: 255
    t.time    "shusha"
    t.time    "taisha"
    t.string  "job",         limit: 255
    t.string  "project",     limit: 255
    t.string  "idm",         limit: 255
    t.string  "sex",         limit: 255
    t.time    "ytaisha"
    t.integer "sum",         limit: 4
    t.integer "monthly",     limit: 4
  end

  create_table "sum_kintai", force: :cascade do |t|
    t.string "idm",          limit: 45
    t.string "sum_kintai",   limit: 45
    t.string "sabun_kintai", limit: 45
    t.string "employee_id",  limit: 45
    t.string "name",         limit: 45
  end

  create_table "test", primary_key: "employee_id", force: :cascade do |t|
    t.string  "sum", limit: 255
    t.integer "id",  limit: 4
  end

  add_index "test", ["employee_id"], name: "employee_id_UNIQUE", unique: true, using: :btree

  create_table "timestores", force: :cascade do |t|
    t.datetime "check_at"
    t.string   "idm",        limit: 255
    t.integer  "kintai_id",  limit: 4
    t.boolean  "entry_flag", limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "left"
    t.time     "entry"
  end

  create_table "users", force: :cascade do |t|
    t.string   "employee_id", limit: 255
    t.string   "name",        limit: 255
    t.string   "job",         limit: 255
    t.string   "project",     limit: 255
    t.string   "sex",         limit: 255
    t.string   "idm",         limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
