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

ActiveRecord::Schema.define(version: 20160416130832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "faalis_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faalis_groups", ["role"], name: "index_faalis_groups_on_role", unique: true, using: :btree

  create_table "faalis_groups_permissions", force: :cascade do |t|
    t.integer "permission_id"
    t.integer "group_id"
  end

  create_table "faalis_groups_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  add_index "faalis_groups_users", ["user_id", "group_id"], name: "by_user_and_group", unique: true, using: :btree

  create_table "faalis_page_menus", force: :cascade do |t|
    t.string   "title"
    t.boolean  "published",  default: false
    t.integer  "user_id"
    t.json     "data"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "site_id"
  end

  add_index "faalis_page_menus", ["site_id"], name: "index_faalis_page_menus_on_site_id", using: :btree

  create_table "faalis_page_pages", force: :cascade do |t|
    t.string   "title"
    t.string   "layout",       default: "layouts/page"
    t.string   "description"
    t.string   "tags"
    t.string   "permalink"
    t.integer  "user_id"
    t.text     "raw_content"
    t.text     "content"
    t.boolean  "members_only", default: false
    t.boolean  "published",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "faalis_page_pages", ["permalink"], name: "index_faalis_page_pages_on_permalink", using: :btree
  add_index "faalis_page_pages", ["site_id"], name: "index_faalis_page_pages_on_site_id", using: :btree

  create_table "faalis_permissions", force: :cascade do |t|
    t.string   "model"
    t.string   "permission_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faalis_permissions", ["model"], name: "index_faalis_permissions_on_model", using: :btree

  create_table "faalis_user_messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "reciver_id"
    t.boolean  "read_only"
    t.text     "content"
    t.text     "raw_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faalis_user_messages", ["reciver_id"], name: "index_faalis_user_messages_on_reciver_id", using: :btree
  add_index "faalis_user_messages", ["sender_id"], name: "index_faalis_user_messages_on_sender_id", using: :btree

  create_table "faalis_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faalis_users", ["email"], name: "index_faalis_users_on_email", unique: true, using: :btree
  add_index "faalis_users", ["reset_password_token"], name: "index_faalis_users_on_reset_password_token", unique: true, using: :btree
  add_index "faalis_users", ["unlock_token"], name: "index_faalis_users_on_unlock_token", unique: true, using: :btree

end
