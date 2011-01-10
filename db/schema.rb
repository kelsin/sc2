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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101225170128) do

  create_table "channels", :force => true do |t|
    t.string   "name"
    t.integer  "ustream_id"
    t.string   "url"
    t.string   "image_url_small"
    t.string   "image_url_medium"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "channels", ["name"], :name => "index_channels_on_name"
  add_index "channels", ["ustream_id"], :name => "index_channels_on_ustream_id"

  create_table "characters", :force => true do |t|
    t.string   "bnet_profile_url"
    t.string   "region"
    t.string   "name"
    t.integer  "code"
    t.integer  "bnet_id"
    t.integer  "portrait_id"
    t.integer  "portrait_row"
    t.integer  "portrait_col"
    t.string   "race"
    t.boolean  "random"
    t.string   "division"
    t.integer  "rank"
    t.integer  "world_rank"
    t.integer  "region_rank"
    t.string   "league"
    t.integer  "points"
    t.integer  "wins"
    t.integer  "losses"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "characters", ["bnet_id"], :name => "index_characters_on_bnet_id"
  add_index "characters", ["name"], :name => "index_characters_on_name"

  create_table "matches", :force => true do |t|
    t.text     "description"
    t.string   "map"
    t.string   "my_race"
    t.string   "vs"
    t.string   "vs_race"
    t.string   "replay_file_name"
    t.string   "replay_content_type"
    t.integer  "replay_file_size"
    t.datetime "replay_updated_at"
    t.integer  "video_id"
    t.integer  "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["map"], :name => "index_matches_on_map"
  add_index "matches", ["my_race"], :name => "index_matches_on_my_race"
  add_index "matches", ["vs_race"], :name => "index_matches_on_vs_race"

  create_table "videos", :force => true do |t|
    t.integer  "ustream_id"
    t.string   "title"
    t.text     "description"
    t.decimal  "length",           :precision => 12, :scale => 3
    t.string   "url"
    t.string   "image_url_small"
    t.string   "image_url_medium"
    t.integer  "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["title"], :name => "index_videos_on_title"
  add_index "videos", ["ustream_id"], :name => "index_videos_on_ustream_id"

end
