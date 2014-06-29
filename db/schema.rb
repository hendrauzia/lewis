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

ActiveRecord::Schema.define(version: 20140628152359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "families", force: true do |t|
    t.integer  "student_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "families", ["parent_id"], name: "index_families_on_parent_id", using: :btree
  add_index "families", ["student_id"], name: "index_families_on_student_id", using: :btree

  create_table "quizzes", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.json     "questions"
    t.json     "answers"
    t.boolean  "published",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scholarships", force: true do |t|
    t.integer  "score"
    t.float    "discount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tryouts", force: true do |t|
    t.integer  "student_id"
    t.integer  "quiz_id"
    t.json     "answers"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "discount"
  end

  add_index "tryouts", ["quiz_id"], name: "index_tryouts_on_quiz_id", using: :btree
  add_index "tryouts", ["student_id"], name: "index_tryouts_on_student_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "city"
    t.string   "address"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

end
