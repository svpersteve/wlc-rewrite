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

ActiveRecord::Schema.define(version: 20170927214501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hackroom_leaders", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "hackroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hackroom_id"], name: "index_hackroom_leaders_on_hackroom_id", unique: true
    t.index ["member_id"], name: "index_hackroom_leaders_on_member_id", unique: true
  end

  create_table "hackrooms", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug"
    t.text "description"
    t.text "long_description"
    t.string "slack"
    t.string "image"
    t.string "colour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_interests", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "interest_id", null: false
    t.index ["interest_id"], name: "index_member_interests_on_interest_id", unique: true
    t.index ["member_id"], name: "index_member_interests_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "username", default: "", null: false
    t.string "slug"
    t.string "email", default: "", null: false
    t.string "provider"
    t.integer "uid"
    t.string "image"
    t.text "bio"
    t.string "city"
    t.string "country"
    t.string "twitter"
    t.string "facebook"
    t.string "instagram"
    t.string "linkedin"
    t.string "github"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["confirmation_token"], name: "index_members_on_confirmation_token", unique: true
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.string "current_role"
    t.boolean "learning_to_code"
    t.boolean "actively_looking_for_engineering_role"
    t.datetime "started_learning_to_code"
    t.text "other_information"
    t.text "admin_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_notes_on_member_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "slug"
    t.datetime "published_at"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_posts_on_author_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
