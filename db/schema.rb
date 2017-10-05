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

ActiveRecord::Schema.define(version: 20171005183010) do

  create_table "artist_genres", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "genre",      default: ""
    t.string   "subgenre",   default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["artist_id"], name: "index_artist_genres_on_artist_id"
  end

  create_table "artist_locations", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "city",       default: ""
    t.string   "state",      default: ""
    t.string   "country",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["artist_id"], name: "index_artist_locations_on_artist_id"
  end

  create_table "artist_members", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "instrument"
    t.string   "name"
    t.boolean  "past",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["artist_id"], name: "index_artist_members_on_artist_id"
  end

  create_table "artist_photo_albums", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "title"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_photo_albums_on_artist_id"
  end

  create_table "artist_photos", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "artist_photo_album_id"
    t.string   "title",                 default: ""
    t.string   "photo"
    t.text     "description",           default: ""
    t.boolean  "cover_photo",           default: false
    t.boolean  "profile_photo",         default: false
    t.string   "slug"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["artist_id"], name: "index_artist_photos_on_artist_id"
    t.index ["artist_photo_album_id"], name: "index_artist_photos_on_artist_photo_album_id"
  end

  create_table "artist_posts", force: :cascade do |t|
    t.integer  "artist_id"
    t.text     "content"
    t.string   "link",       default: ""
    t.string   "image",      default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["artist_id"], name: "index_artist_posts_on_artist_id"
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

  create_table "artist_relationships", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "fan_id"
    t.boolean  "post_email",  default: true
    t.boolean  "photo_email", default: true
    t.boolean  "video_email", default: true
    t.boolean  "merch_email", default: true
    t.boolean  "tour_email",  default: true
    t.boolean  "show_email",  default: true
    t.boolean  "album_email", default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["artist_id"], name: "index_artist_relationships_on_artist_id"
    t.index ["fan_id"], name: "index_artist_relationships_on_fan_id"
  end

  create_table "artist_show_locations", force: :cascade do |t|
    t.string   "artist_show"
    t.string   "city",        default: ""
    t.string   "state",       default: ""
    t.string   "country",     default: ""
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "artist_shows", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "artist_tour_id"
    t.string   "title"
    t.integer  "month"
    t.integer  "day"
    t.integer  "year"
    t.string   "venue"
    t.string   "location"
    t.text     "description"
    t.string   "ticket_url"
    t.string   "image"
    t.boolean  "is_independent?"
    t.string   "slug"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["artist_id"], name: "index_artist_shows_on_artist_id"
    t.index ["artist_tour_id"], name: "index_artist_shows_on_artist_tour_id"
  end

  create_table "artist_themes", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "main_color",       default: ""
    t.string   "text_color",       default: ""
    t.string   "background_color", default: ""
    t.string   "link_color",       default: ""
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["artist_id"], name: "index_artist_themes_on_artist_id"
  end

  create_table "artist_tours", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "title"
    t.text     "description"
    t.integer  "amount_of_shows"
    t.string   "artists"
    t.string   "image"
    t.string   "slug"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["artist_id"], name: "index_artist_tours_on_artist_id"
  end

  create_table "artist_videos", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "title"
    t.text     "description"
    t.string   "video"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["artist_id"], name: "index_artist_videos_on_artist_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string   "username",               default: "",   null: false
    t.string   "name",                   default: "",   null: false
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "slug",                   default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,    null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "comment_email",          default: true
    t.boolean  "follow_email",           default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["confirmation_token"], name: "index_artists_on_confirmation_token", unique: true
    t.index ["email"], name: "index_artists_on_email", unique: true
    t.index ["reset_password_token"], name: "index_artists_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_artists_on_slug", unique: true
    t.index ["unlock_token"], name: "index_artists_on_unlock_token", unique: true
    t.index ["username"], name: "index_artists_on_username", unique: true
  end

  create_table "fan_locations", force: :cascade do |t|
    t.integer  "fan_id"
    t.string   "city",       default: ""
    t.string   "state",      default: ""
    t.string   "country",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["fan_id"], name: "index_fan_locations_on_fan_id"
  end

  create_table "fan_profiles", force: :cascade do |t|
    t.integer  "fan_id"
    t.text     "biography",        default: ""
    t.string   "website_url",      default: ""
    t.string   "facebook_handle",  default: ""
    t.string   "facebook_url",     default: ""
    t.string   "twitter_handle",   default: ""
    t.string   "twitter_url",      default: ""
    t.string   "instagram_handle", default: ""
    t.string   "instagram_url",    default: ""
    t.string   "youtube_handle",   default: ""
    t.string   "youtube_url",      default: ""
    t.string   "letlyrics_url",    default: ""
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["fan_id"], name: "index_fan_profiles_on_fan_id"
  end

  create_table "fan_themes", force: :cascade do |t|
    t.integer  "fan_id"
    t.string   "main_color",       default: ""
    t.string   "text_color",       default: ""
    t.string   "background_color", default: ""
    t.string   "link_color",       default: ""
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["fan_id"], name: "index_fan_themes_on_fan_id"
  end

  create_table "fans", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "slug",                   default: "", null: false
    t.string   "name",                   default: "", null: false
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
    t.index ["confirmation_token"], name: "index_fans_on_confirmation_token", unique: true
    t.index ["email"], name: "index_fans_on_email", unique: true
    t.index ["reset_password_token"], name: "index_fans_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_fans_on_slug", unique: true
    t.index ["unlock_token"], name: "index_fans_on_unlock_token", unique: true
    t.index ["username"], name: "index_fans_on_username", unique: true
  end

end
