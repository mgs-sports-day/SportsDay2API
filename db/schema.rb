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

ActiveRecord::Schema.define(version: 2019_04_07_212015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allocations", force: :cascade do |t|
    t.time "starts_at"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "competitor"
    t.integer "year_group"
    t.string "location"
    t.index ["event_id"], name: "index_allocations_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.integer "competitors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "score_units"
    t.string "world_record"
    t.string "world_record_holder"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "letsencrypt_certificates", force: :cascade do |t|
    t.string "domain"
    t.text "certificate"
    t.text "intermediaries"
    t.text "key"
    t.datetime "expires_at"
    t.datetime "renew_after"
    t.string "verification_path"
    t.string "verification_string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain"], name: "index_letsencrypt_certificates_on_domain"
    t.index ["renew_after"], name: "index_letsencrypt_certificates_on_renew_after"
  end

  create_table "records", force: :cascade do |t|
    t.float "score"
    t.string "units"
    t.string "holder"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "current_record"
    t.bigint "form_id"
    t.string "past_form"
    t.integer "past_year_group"
    t.bigint "event_id"
    t.string "competitor"
    t.index ["event_id"], name: "index_records_on_event_id"
    t.index ["form_id"], name: "index_records_on_form_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "form_id"
    t.integer "score"
    t.string "competitor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "token_id"
    t.index ["event_id"], name: "index_scores_on_event_id"
    t.index ["form_id"], name: "index_scores_on_form_id"
    t.index ["token_id"], name: "index_scores_on_token_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "token"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "allocations", "events"
  add_foreign_key "records", "events"
  add_foreign_key "scores", "events"
  add_foreign_key "scores", "forms"
  add_foreign_key "scores", "tokens"
end
