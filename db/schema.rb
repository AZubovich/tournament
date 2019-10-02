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

ActiveRecord::Schema.define(version: 2019_10_02_060447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.text "description"
    t.string "image_url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_achievements_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "first_player_id"
    t.integer "second_player_id"
    t.integer "first_player_time"
    t.integer "second_player_time"
    t.integer "task_id"
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "first_player_name"
    t.string "second_player_name"
    t.index ["tournament_id"], name: "index_games_on_tournament_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "nick_name"
    t.integer "points"
    t.bigint "user_id"
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "round"
    t.index ["tournament_id"], name: "index_players_on_tournament_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.text "description"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "prize"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kind"
    t.integer "limit"
    t.string "status"
    t.integer "round"
    t.integer "prize_winner"
    t.string "prize_distribution"
    t.index ["user_id"], name: "index_tournaments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.boolean "admin"
    t.boolean "super_admin"
    t.string "nick_name"
    t.integer "money"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "achievements", "users"
  add_foreign_key "games", "tournaments"
  add_foreign_key "players", "tournaments"
  add_foreign_key "players", "users"
  add_foreign_key "tournaments", "users"
end
