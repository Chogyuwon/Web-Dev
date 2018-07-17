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

ActiveRecord::Schema.define(version: 20170815110723) do

  create_table "comment_likes", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_likes_on_comment_id"
    t.index ["user_id"], name: "index_comment_likes_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.string "choice"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "post_likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.string "like_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_likes_on_post_id"
    t.index ["user_id"], name: "index_post_likes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "post_type"
    t.string "first_choice_label"
    t.string "second_choice_label"
    t.string "use_speaker"
    t.string "image_1"
    t.string "image_2"
    t.string "image_3"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "speakers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_speakers_on_post_id"
    t.index ["user_id"], name: "index_speakers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "provider"
    t.boolean "admin"
    t.string "name"
    t.string "image"
    t.string "token"
    t.string "refresh_token"
    t.string "expires_at"
    t.string "expires"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age"
    t.string "gender"
    t.string "nickname"
    t.string "email"
    t.string "area"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.string "vote_choice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_votes_on_post_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

end
