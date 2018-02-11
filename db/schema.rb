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

ActiveRecord::Schema.define(version: 20180123022622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", id: :serial, force: :cascade do |t|
    t.integer "department_id", null: false
    t.string "name", null: false
    t.integer "number", null: false
    t.integer "min_credits", null: false
    t.integer "max_credits", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description", default: ""
    t.uuid "uuid", null: false
    t.index ["department_id", "number"], name: "index_courses_on_department_id_and_number", unique: true
    t.index ["name"], name: "index_courses_on_name"
    t.index ["uuid"], name: "index_courses_on_uuid"
  end

  create_table "crono_jobs", id: :serial, force: :cascade do |t|
    t.string "job_id", null: false
    t.text "log"
    t.datetime "last_performed_at"
    t.boolean "healthy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_crono_jobs_on_job_id", unique: true
  end

  create_table "departments", id: :serial, force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "school_id"
    t.uuid "uuid", null: false
    t.index ["code"], name: "index_departments_on_code", unique: true
    t.index ["uuid"], name: "index_departments_on_uuid"
  end

  create_table "schools", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "uuid", null: false
    t.index ["uuid"], name: "index_schools_on_uuid"
  end

  create_table "sections", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.integer "crn", null: false
    t.integer "course_id", null: false
    t.integer "seats", null: false
    t.integer "seats_taken", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "num_periods", default: 0, null: false
    t.integer "periods_day", default: [], null: false, array: true
    t.integer "periods_start", default: [], null: false, array: true
    t.integer "periods_end", default: [], null: false, array: true
    t.string "periods_type", default: [], null: false, array: true
    t.string "instructors", default: [], null: false, array: true
    t.integer "conflicts", default: [], null: false, array: true
    t.uuid "uuid", null: false
    t.index ["course_id", "name"], name: "index_sections_on_course_id_and_name", unique: true
    t.index ["course_id"], name: "index_sections_on_course_id"
    t.index ["uuid"], name: "index_sections_on_uuid"
  end

end
