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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130408010451) do

  create_table "items", :force => true do |t|
    t.string   "caption",            :null => false
    t.string   "attribution"
    t.string   "scaled_image_key",   :null => false
    t.string   "original_image_key", :null => false
    t.integer  "stream_id"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "streams", :force => true do |t|
    t.string   "slug",                                :null => false
    t.string   "upvote_copy"
    t.string   "downvote_copy"
    t.string   "background_color"
    t.boolean  "nsfw",             :default => false, :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "streams", ["slug"], :name => "index_streams_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "item_id",    :null => false
    t.integer  "user_id",    :null => false
    t.boolean  "value",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "votes", ["item_id", "user_id"], :name => "index_votes_on_item_id_and_user_id", :unique => true
  add_index "votes", ["item_id"], :name => "index_votes_on_item_id"

end
