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

ActiveRecord::Schema.define(version: 2018_12_30_160114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lessons", force: :cascade do |t|
    t.integer "lesson_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "session_id"
    t.index ["session_id"], name: "index_lessons_on_session_id"
  end

  create_table "pairs", force: :cascade do |t|
    t.bigint "student1_id"
    t.bigint "student2_id"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_pairs_on_lesson_id"
    t.index ["student1_id"], name: "index_pairs_on_student1_id"
    t.index ["student2_id"], name: "index_pairs_on_student2_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "num_lessons", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "num_students", default: 0
    t.integer "current_lesson", default: 1
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.boolean "available", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "session_id"
    t.boolean "alone", default: false
    t.index ["session_id"], name: "index_students_on_session_id"
  end

  add_foreign_key "lessons", "sessions"
  add_foreign_key "pairs", "lessons"
  add_foreign_key "students", "sessions"
end
