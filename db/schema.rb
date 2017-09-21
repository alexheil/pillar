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

ActiveRecord::Schema.define(version: 20170921183103) do

  create_table "artist_genres", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "genre"
    t.string   "subgenre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_genres_on_artist_id"
  end

  create_table "artist_profiles", force: :cascade do |t|
    t.integer  "artist_id"
    t.text     "biography",             default: ""
    t.integer  "year_founded"
    t.string   "email",                 default: ""
    t.string   "website_url",           default: ""
    t.string   "facebook_handle",       default: ""
    t.string   "facebook_url",          default: ""
    t.string   "twitter_handle",        default: ""
    t.string   "twitter_url",           default: ""
    t.string   "instagram_handle",      default: ""
    t.string   "instagram_url",         default: ""
    t.string   "youtube_handle",        default: ""
    t.string   "youtube_url",           default: ""
    t.string   "letlyrics_url",         default: ""
    t.string   "record_label",          default: ""
    t.string   "influences",            default: ""
    t.string   "general_manager_name",  default: ""
    t.string   "general_manager_email", default: ""
    t.string   "press_contact_name",    default: ""
    t.string   "press_contact_email",   default: ""
    t.string   "booking_agent_name",    default: ""
    t.string   "booking_agent_email",   default: ""
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["artist_id"], name: "index_artist_profiles_on_artist_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "slug",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_artists_on_confirmation_token", unique: true
    t.index ["email"], name: "index_artists_on_email", unique: true
    t.index ["reset_password_token"], name: "index_artists_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_artists_on_slug", unique: true
    t.index ["unlock_token"], name: "index_artists_on_unlock_token", unique: true
    t.index ["username"], name: "index_artists_on_username", unique: true
  end

end
