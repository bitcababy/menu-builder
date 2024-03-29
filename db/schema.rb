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

ActiveRecord::Schema.define(:version => 10) do

  create_table "menu_items", :force => true do |t|
    t.string   "type"
    t.integer  "parent_id"
    t.string   "text"
    t.boolean  "enabled"
    t.boolean  "visible"
    t.string   "link"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "menu_items", ["parent_id"], :name => "index_menu_items_on_parent_id"
  add_index "menu_items", ["type"], :name => "index_menu_items_on_type"
  add_index "menu_items", ["visible"], :name => "index_menu_items_on_visible"

end
