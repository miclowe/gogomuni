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

ActiveRecord::Schema.define(:version => 20130611045122) do

  create_table "directions", :force => true do |t|
    t.string   "d_title"
    t.integer  "route_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "directions", ["route_id"], :name => "index_directions_on_route_id"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "routes", :force => true do |t|
    t.string   "r_tag"
    t.string   "r_title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stops", :force => true do |t|
    t.string   "s_tag"
    t.string   "s_title"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "r_tag"
    t.string   "d_title"
    t.string   "d_tag"
    t.integer  "route_id"
    t.integer  "direction_id"
  end

  create_table "transits", :force => true do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "walk_duration"
    t.boolean  "weekday"
    t.boolean  "weekend"
    t.boolean  "pause"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "route"
    t.string   "stop"
    t.string   "direction"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "hue"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
