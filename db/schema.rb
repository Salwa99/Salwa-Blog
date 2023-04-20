# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", id: :serial, force: :cascade do |t|
    t.integer "author_id"
    t.integer "post_id"
    t.text "text", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil
    t.index ["author_id", "post_id"], name: "idx_comments_author_post"
  end

  create_table "likes", id: :serial, force: :cascade do |t|
    t.integer "author_id"
    t.integer "post_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil
    t.index ["author_id", "post_id"], name: "idx_likes_author_post"
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.integer "author_id"
    t.string "title", limit: 255, null: false
    t.text "text", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil
    t.integer "comments_counter", default: 0
    t.integer "likes_counter", default: 0
    t.index ["author_id"], name: "idx_posts_author_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "photo", null: false
    t.text "bio"
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.integer "posts_counter", default: 0
    t.index ["name"], name: "idx_users_name"
  end

  add_foreign_key "comments", "posts", name: "comments_post_id_fkey"
  add_foreign_key "comments", "users", column: "author_id", name: "comments_author_id_fkey"
  add_foreign_key "likes", "posts", name: "likes_post_id_fkey"
  add_foreign_key "likes", "users", column: "author_id", name: "likes_author_id_fkey"
  add_foreign_key "posts", "users", column: "author_id", name: "posts_author_id_fkey"
end
