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

ActiveRecord::Schema.define(version: 20180107104101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "dblink"
  enable_extension "xml2"
  enable_extension "ltree"
  enable_extension "pgstattuple"
  enable_extension "tablefunc"
  enable_extension "fuzzystrmatch"
  enable_extension "citext"
  enable_extension "uuid-ossp"
  enable_extension "pgcrypto"
  enable_extension "pg_trgm"
  enable_extension "intarray"
  enable_extension "hstore"
  enable_extension "dict_int"
  enable_extension "btree_gin"
  enable_extension "pgrowlocks"
  enable_extension "cube"
  enable_extension "earthdistance"
  enable_extension "btree_gist"
  enable_extension "dict_xsyn"
  enable_extension "unaccent"
  enable_extension "pg_stat_statements"

  create_table "group_members", force: :cascade do |t|
    t.integer "member"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "group_name"
    t.string "group_description"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_groups_on_created_by"
  end

  create_table "messages", force: :cascade do |t|
    t.string "message_content"
    t.integer "posted_by"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_messages_on_group_id"
    t.index ["posted_by"], name: "index_messages_on_posted_by"
  end

  create_table "status_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "commented_by"
    t.bigint "status_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_post_id"], name: "index_status_comments_on_status_post_id"
  end

  create_table "status_posts", force: :cascade do |t|
    t.text "post"
    t.integer "posted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "group_members", "groups"
  add_foreign_key "group_members", "groups"
  add_foreign_key "group_members", "users", column: "member"
  add_foreign_key "group_members", "users", column: "member"
  add_foreign_key "groups", "users", column: "created_by"
  add_foreign_key "messages", "groups"
  add_foreign_key "messages", "users", column: "posted_by"
  add_foreign_key "status_comments", "status_posts"
end
