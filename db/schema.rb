# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140528013652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "playlists", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "playlists", ["user_id"], :name => "index_playlists_on_user_id"

  create_table "songs", force: true do |t|
    t.string   "artist"
    t.string   "title"
    t.string   "genre"
    t.integer  "duration"
    t.string   "album"
    t.integer  "user_id"
    t.integer  "playlist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "songs", ["playlist_id"], :name => "index_songs_on_playlist_id"
  add_index "songs", ["user_id"], :name => "index_songs_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "age"
    t.string   "gender"
    t.string   "password_digest"
    t.string   "city"
    t.string   "state"
    t.spatial  "coordinates",     limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end