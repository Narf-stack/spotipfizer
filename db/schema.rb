# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_05_130224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deviseusers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "spotify_access_token"
    t.string "spotifyid"
    t.string "name"
    t.index ["name", "spotifyid"], name: "index_deviseusers_on_name_and_spotifyid", unique: true
    t.index ["reset_password_token"], name: "index_deviseusers_on_reset_password_token", unique: true
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name", default: ""
    t.string "playlist_spotifyid", default: ""
    t.text "uris", default: [], array: true
    t.text "description", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "deviseuser_id", null: false
    t.integer "energy", default: 0
    t.integer "valence", default: 0
    t.integer "popularity", default: 0
    t.string "spotify_url", default: ""
    t.text "genres", default: [], array: true
    t.index ["deviseuser_id"], name: "index_playlists_on_deviseuser_id"
  end

  create_table "search_recos", force: :cascade do |t|
    t.integer "energy", default: 0
    t.integer "valence", default: 0
    t.integer "popularity", default: 0
    t.text "genres", default: [], array: true
    t.bigint "playlist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["playlist_id"], name: "index_search_recos_on_playlist_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name", default: ""
    t.string "spotify_link_album", default: ""
    t.string "spotify_track_link", default: ""
    t.text "artists", default: [], array: true
    t.string "url_image", default: ""
    t.string "spotify_track_uri", default: ""
    t.bigint "playlist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["playlist_id"], name: "index_tracks_on_playlist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "spotifyid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "spotifyid"], name: "index_users_on_name_and_spotifyid", unique: true
  end

  add_foreign_key "playlists", "deviseusers"
  add_foreign_key "search_recos", "playlists"
  add_foreign_key "tracks", "playlists"
end
