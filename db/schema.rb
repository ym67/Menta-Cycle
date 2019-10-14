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

ActiveRecord::Schema.define(version: 2019_10_14_021059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "big5_scores", force: :cascade do |t|
    t.integer "q1", default: 4, null: false
    t.integer "q2", default: 4, null: false
    t.integer "q3", default: 4, null: false
    t.integer "q4", default: 4, null: false
    t.integer "q5", default: 4, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "q6", default: 4, null: false
    t.integer "q7", default: 4, null: false
    t.integer "q8", default: 4, null: false
    t.integer "q9", default: 4, null: false
    t.integer "q10", default: 4, null: false
  end

end
