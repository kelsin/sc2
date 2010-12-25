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

ActiveRecord::Schema.define(:version => 20101225021231) do

  create_table "characters", :force => true do |t|
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

end
