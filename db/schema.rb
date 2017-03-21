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

ActiveRecord::Schema.define(version: 20170321192331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.float    "latitude",   null: false
    t.float    "longitude",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",                         null: false
    t.datetime "starts_at",                    null: false
    t.time     "ends_at",                      null: false
    t.string   "address",                      null: false
    t.float    "latitude",                     null: false
    t.float    "longitude",                    null: false
    t.integer  "user_limit",                   null: false
    t.integer  "team_limit",                   null: false
    t.boolean  "public",        default: true
    t.text     "description",                  null: false
    t.integer  "price",                        null: false
    t.integer  "sport_type_id"
    t.integer  "creator_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["creator_id"], name: "index_events_on_creator_id", using: :btree
    t.index ["sport_type_id"], name: "index_events_on_sport_type_id", using: :btree
  end

  create_table "invites", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.boolean  "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_invites_on_event_id", using: :btree
    t.index ["user_id"], name: "index_invites_on_user_id", using: :btree
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_memberships_on_event_id", using: :btree
    t.index ["user_id"], name: "index_memberships_on_user_id", using: :btree
  end

  create_table "sport_types", force: :cascade do |t|
    t.string   "name",                     null: false
    t.string   "color",                    null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "icon",                     null: false
    t.integer  "events_count", default: 0
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "number",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_teams_on_event_id", using: :btree
    t.index ["user_id"], name: "index_teams_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",               null: false
    t.string   "last_name",                null: false
    t.string   "phone_number",             null: false
    t.string   "avatar"
    t.string   "api_token"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "votes_count",  default: 0
    t.index ["api_token"], name: "index_users_on_api_token", unique: true, using: :btree
  end

  create_table "verification_tokens", force: :cascade do |t|
    t.string   "token",                        null: false
    t.string   "phone_number",                 null: false
    t.string   "code",                         null: false
    t.boolean  "verified",     default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["token"], name: "index_verification_tokens_on_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "voted_user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["event_id"], name: "index_votes_on_event_id", using: :btree
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
    t.index ["voted_user_id"], name: "index_votes_on_voted_user_id", using: :btree
  end

  add_foreign_key "events", "sport_types"
  add_foreign_key "events", "users", column: "creator_id"
  add_foreign_key "invites", "events"
  add_foreign_key "invites", "users"
  add_foreign_key "memberships", "events"
  add_foreign_key "memberships", "users"
  add_foreign_key "votes", "events"
  add_foreign_key "votes", "users"
  add_foreign_key "votes", "users", column: "voted_user_id"
end
