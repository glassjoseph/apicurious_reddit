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

ActiveRecord::Schema.define(version: 20170512133826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "score"
    t.json    "replies"
    t.string  "author"
    t.string  "parent_id"
    t.string  "body"
    t.string  "body_html"
    t.string  "name"
    t.integer "depth"
  end

  create_table "posts", force: :cascade do |t|
    t.string  "pid"
    t.json    "data"
    t.string  "url"
    t.integer "score"
    t.json    "preview"
    t.string  "title"
    t.integer "downs"
    t.integer "ups"
    t.string  "permalink"
    t.string  "thumbnail"
    t.integer "subreddit_id"
    t.index ["subreddit_id"], name: "index_posts_on_subreddit_id", using: :btree
  end

  create_table "subreddits", force: :cascade do |t|
    t.string  "display_name"
    t.string  "description"
    t.string  "url"
    t.integer "subscribers"
    t.string  "title"
    t.string  "icon_img"
    t.integer "user_id"
    t.index ["user_id"], name: "index_subreddits_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "token"
    t.integer  "token_expiration"
    t.integer  "link_karma"
    t.integer  "comment_karma"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "posts", "subreddits"
  add_foreign_key "subreddits", "users"
end
