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

ActiveRecord::Schema.define(version: 2019_10_28_103005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "big5_scores", force: :cascade do |t|
    t.integer "q1", default: 1, null: false
    t.integer "q2", default: 1, null: false
    t.integer "q3", default: 1, null: false
    t.integer "q4", default: 1, null: false
    t.integer "q5", default: 1, null: false
    t.integer "q6", default: 1, null: false
    t.integer "q7", default: 1, null: false
    t.integer "q8", default: 1, null: false
    t.integer "q9", default: 1, null: false
    t.integer "q10", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_big5_scores_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.text "content", default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "pss4s", force: :cascade do |t|
    t.integer "q1", default: 0, null: false
    t.integer "q2", default: 0, null: false
    t.integer "q3", default: 0, null: false
    t.integer "q4", default: 0, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score", default: 0, null: false
    t.index ["user_id"], name: "index_pss4s_on_user_id"
  end

  create_table "ssses", force: :cascade do |t|
    t.integer "q1", default: 0, null: false
    t.integer "q2", default: 0, null: false
    t.integer "q3", default: 0, null: false
    t.integer "q4", default: 0, null: false
    t.integer "q5", default: 0, null: false
    t.integer "q6", default: 0, null: false
    t.integer "q7", default: 0, null: false
    t.integer "q8", default: 0, null: false
    t.integer "q9", default: 0, null: false
    t.integer "q10", default: 0, null: false
    t.integer "q11", default: 0, null: false
    t.integer "q12", default: 0, null: false
    t.integer "q13", default: 0, null: false
    t.integer "q14", default: 0, null: false
    t.integer "q15", default: 0, null: false
    t.integer "q16", default: 0, null: false
    t.integer "q17", default: 0, null: false
    t.integer "q18", default: 0, null: false
    t.integer "q19", default: 0, null: false
    t.integer "q20", default: 0, null: false
    t.integer "q21", default: 0, null: false
    t.integer "q22", default: 0, null: false
    t.integer "q23", default: 0, null: false
    t.integer "q24", default: 0, null: false
    t.integer "q25", default: 0, null: false
    t.integer "q26", default: 0, null: false
    t.integer "q27", default: 0, null: false
    t.integer "q28", default: 0, null: false
    t.integer "q29", default: 0, null: false
    t.integer "q30", default: 0, null: false
    t.integer "q31", default: 0, null: false
    t.integer "q32", default: 0, null: false
    t.integer "q33", default: 0, null: false
    t.integer "q34", default: 0, null: false
    t.integer "q35", default: 0, null: false
    t.integer "q36", default: 0, null: false
    t.integer "q37", default: 0, null: false
    t.integer "q38", default: 0, null: false
    t.integer "q39", default: 0, null: false
    t.integer "q40", default: 0, null: false
    t.integer "score", default: 0, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "action", default: 0, null: false
    t.integer "condition", default: 0, null: false
    t.integer "emotions", default: 0, null: false
    t.index ["user_id"], name: "index_ssses_on_user_id"
  end

  create_table "stress_diaries", force: :cascade do |t|
    t.time "time", null: false
    t.integer "stress_level", default: 0, null: false
    t.integer "duration", null: false
    t.string "situation", default: "", null: false
    t.string "trigger", default: "", null: false
    t.string "reaction", default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_stress_diaries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "gender", default: true, null: false
    t.string "age", default: "10", null: false
    t.boolean "admin", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "big5_scores", "users"
  add_foreign_key "contacts", "users"
  add_foreign_key "pss4s", "users"
  add_foreign_key "ssses", "users"
  add_foreign_key "stress_diaries", "users"
end
