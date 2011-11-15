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

ActiveRecord::Schema.define(:version => 20111115014749) do

  create_table "comments", :force => true do |t|
    t.integer  "ticket_id"
    t.string   "full_name"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "owner_id"
    t.string   "kind"
    t.string   "severity"
    t.string   "status"
    t.string   "reporter_full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "full_name"
    t.string   "group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
