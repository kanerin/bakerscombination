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

ActiveRecord::Schema.define(version: 2022_02_02_081322) do

  create_table "bakerscombinations", force: :cascade do |t|
    t.text "name"
    t.float "ingredient_1"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "ingredient_1_name"
    t.float "ingredient_2"
    t.text "ingredient_2_name"
    t.float "ingredient_3"
    t.text "ingredient_3_name"
    t.float "ingredient_4"
    t.text "ingredient_4_name"
    t.float "ingredient_5"
    t.text "ingredient_5_name"
    t.float "ingredient_6"
    t.text "ingredient_6_name"
    t.float "ingredient_7"
    t.text "ingredient_7_name"
    t.text "microwave_manufacturer"
    t.text "microwave_number"
    t.text "bakery_manufacturer"
    t.text "bakery_number"
    t.integer "user_id"
    t.string "image"
    t.integer "ferment1_time_minutes"
    t.integer "ferment1_time_seconds"
    t.integer "ferment1_temperature"
    t.integer "ferment2_time_minutes"
    t.integer "ferment2_time_seconds"
    t.integer "ferment2_temperature"
    t.integer "roasted_time_minutes"
    t.integer "roasted_time_seconds"
    t.integer "roasted_temperature"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.float "star"
    t.integer "user_id", null: false
    t.integer "tweet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tweet_id"], name: "index_comments_on_tweet_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "bakerscombination_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bakerscombination_id"], name: "index_likes_on_bakerscombination_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "bakerscombination_id", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bakerscombination_id"], name: "index_reviews_on_bakerscombination_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "ingredient_1"
    t.text "ingredient_1_name"
    t.float "ingredient_2"
    t.text "ingredient_2_name"
    t.float "ingredient_3"
    t.text "ingredient_3_name"
    t.float "ingredient_4"
    t.text "ingredient_4_name"
    t.float "ingredient_5"
    t.text "ingredient_5_name"
    t.float "ingredient_6"
    t.text "ingredient_6_name"
    t.float "ingredient_7"
    t.text "ingredient_7_name"
    t.text "microwave_manufacturer"
    t.text "microwave_number"
    t.text "bakery_manufacturer"
    t.text "bakery_number"
    t.integer "ferment1_time_minutes"
    t.integer "ferment1_time_seconds"
    t.integer "ferment1_temperature"
    t.integer "ferment2_time_minutes"
    t.integer "ferment2_time_seconds"
    t.integer "ferment2_temperature"
    t.integer "roasted_time_minutes"
    t.integer "roasted_time_seconds"
    t.integer "roasted_temperature"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "tweets"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "bakerscombinations"
  add_foreign_key "likes", "users"
  add_foreign_key "reviews", "bakerscombinations"
  add_foreign_key "reviews", "users"
end
