# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_26_205129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attends", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "gig_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gig_id"], name: "index_attends_on_gig_id"
    t.index ["user_id"], name: "index_attends_on_user_id"
  end

  create_table "follow_people", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "performer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["performer_id"], name: "index_follow_people_on_performer_id"
    t.index ["user_id"], name: "index_follow_people_on_user_id"
  end

  create_table "follow_places", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "venue_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_follow_places_on_user_id"
    t.index ["venue_id"], name: "index_follow_places_on_venue_id"
  end

  create_table "gigs", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "time"
    t.string "poster"
    t.text "description"
    t.string "category"
    t.boolean "published"
    t.float "latitude"
    t.float "longitude"
    t.integer "host_id"
    t.string "host_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "venue_name"
    t.string "venue_address"
    t.boolean "age"
  end

  create_table "invite_performers", force: :cascade do |t|
    t.bigint "performer_id", null: false
    t.bigint "gig_id", null: false
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gig_id"], name: "index_invite_performers_on_gig_id"
    t.index ["performer_id"], name: "index_invite_performers_on_performer_id"
  end

  create_table "invite_venues", force: :cascade do |t|
    t.bigint "venue_id", null: false
    t.bigint "gig_id", null: false
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gig_id"], name: "index_invite_venues_on_gig_id"
    t.index ["venue_id"], name: "index_invite_venues_on_venue_id"
  end

  create_table "performers", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.string "photo"
    t.string "location"
    t.json "social_media"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "location"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.text "bio"
    t.string "photo"
    t.json "social_media"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "attends", "gigs"
  add_foreign_key "attends", "users"
  add_foreign_key "follow_people", "performers"
  add_foreign_key "follow_people", "users"
  add_foreign_key "follow_places", "users"
  add_foreign_key "follow_places", "venues"
  add_foreign_key "invite_performers", "gigs"
  add_foreign_key "invite_performers", "performers"
  add_foreign_key "invite_venues", "gigs"
  add_foreign_key "invite_venues", "venues"
end
