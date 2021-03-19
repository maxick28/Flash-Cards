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

ActiveRecord::Schema.define(version: 2021_02_17_155125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "front", null: false
    t.string "back", null: false
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "collection_id", null: false
    t.index ["collection_id"], name: "index_cards_on_collection_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_collections_on_category_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "rating_rates", id: :serial, force: :cascade do |t|
    t.decimal "value", precision: 25, scale: 16, default: "0.0"
    t.string "author_type", limit: 10, null: false
    t.integer "author_id", null: false
    t.string "resource_type", limit: 10, null: false
    t.integer "resource_id", null: false
    t.string "scopeable_type", limit: 10
    t.integer "scopeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id", "resource_type", "resource_id", "scopeable_type", "scopeable_id"], name: "index_rating_rates_on_author_and_resource_and_scopeable", unique: true
    t.index ["author_type", "author_id"], name: "index_rating_rates_on_author"
    t.index ["resource_type", "resource_id"], name: "index_rating_rates_on_resource"
    t.index ["scopeable_type", "scopeable_id"], name: "index_rating_rates_on_scopeable"
  end

  create_table "rating_ratings", id: :serial, force: :cascade do |t|
    t.decimal "average", precision: 25, scale: 16, default: "0.0"
    t.decimal "estimate", precision: 25, scale: 16, default: "0.0"
    t.integer "sum", default: 0
    t.integer "total", default: 0
    t.string "resource_type", limit: 10, null: false
    t.integer "resource_id", null: false
    t.string "scopeable_type", limit: 10
    t.integer "scopeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_type", "resource_id", "scopeable_type", "scopeable_id"], name: "index_rating_rating_on_resource_and_scopeable", unique: true
    t.index ["resource_type", "resource_id"], name: "index_rating_ratings_on_resource"
    t.index ["scopeable_type", "scopeable_id"], name: "index_rating_ratings_on_scopeable"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rate"
    t.bigint "collections_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["collections_id"], name: "index_ratings_on_collections_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rate"
    t.bigint "collection_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collection_id"], name: "index_reviews_on_collection_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "collection_id"
    t.integer "spent_time"
    t.integer "skipped_cards", default: [], array: true
    t.string "status", default: "pending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cards", "collections"
  add_foreign_key "ratings", "collections", column: "collections_id"
  add_foreign_key "ratings", "users"
  add_foreign_key "reviews", "collections"
  add_foreign_key "reviews", "users"
  add_foreign_key "scores", "users"
  add_foreign_key "collections", "users"
  add_foreign_key "collections", "categories"
end
