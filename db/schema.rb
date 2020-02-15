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

ActiveRecord::Schema.define(version: 2020_02_05_204650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "contactname"
    t.string "email"
    t.string "subject"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "notification_params"
    t.string "status"
    t.string "transaction_id"
    t.datetime "purchased_at"
    t.index ["program_id"], name: "index_enrollments_on_program_id"
    t.index ["user_id", "program_id"], name: "index_enrollments_on_user_id_and_program_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_galleries_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "tag_text"
    t.decimal "cost"
    t.date "start_date"
    t.date "end_date"
    t.text "meet_times"
    t.string "address"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "image"
    t.index ["user_id"], name: "index_programs_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "gender"
    t.string "cell"
    t.string "playeremail"
    t.string "parent1"
    t.string "parent1cell"
    t.string "parent2"
    t.string "parent2email"
    t.string "parent2cell"
    t.string "location"
    t.string "homeaddress"
    t.string "homecity"
    t.string "homestate"
    t.string "homezip"
    t.string "school"
    t.string "yearschool"
    t.date "dob"
    t.string "position1"
    t.string "position2"
    t.string "referredby"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end


  create_view "report_enrollments", sql_definition: <<-SQL
      SELECT users.email,
      users.firstname,
      users.lastname,
      users.cell,
      users.parent1,
      users.parent2,
      enrollments.program_id,
      programs.title,
      programs.cost
     FROM ((users
       JOIN enrollments ON ((users.id = enrollments.user_id)))
       JOIN programs ON ((enrollments.program_id = programs.id)))
    ORDER BY users.lastname, users.firstname;
  SQL
end
