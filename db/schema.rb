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

ActiveRecord::Schema.define(version: 20170830193615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contract_ownership_periods", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contract_id"
    t.bigint "owner_id"
    t.datetime "start_week"
    t.datetime "end_week"
    t.index ["contract_id"], name: "index_contract_ownership_periods_on_contract_id"
    t.index ["owner_id"], name: "index_contract_ownership_periods_on_owner_id"
  end

  create_table "contract_years", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contract_id"
    t.bigint "owner_id"
    t.datetime "season"
    t.decimal "liability"
    t.integer "liability_type"
    t.index ["contract_id"], name: "index_contract_years_on_contract_id"
    t.index ["owner_id"], name: "index_contract_years_on_owner_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_day"
    t.datetime "end_day"
    t.decimal "base_salary"
    t.decimal "bonus"
    t.integer "contract_type"
    t.integer "signing_type"
  end

  create_table "owners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "team_name"
  end

  create_table "players", force: :cascade do |t|
    t.integer "draft_year"
    t.integer "draft_round"
    t.string "nfl_id"
    t.integer "rotoworld_id"
    t.integer "stats_id"
    t.string "position"
    t.integer "stats_global_id"
    t.integer "espn_id"
    t.integer "kffl_id"
    t.integer "weight"
    t.integer "mfl_id"
    t.integer "fleaflicker_id"
    t.datetime "birthdate"
    t.integer "draft_pick"
    t.string "name"
    t.string "college"
    t.integer "height"
    t.integer "jersey"
    t.string "twitter_username"
    t.string "sportsdata_id"
    t.integer "cbs_id"
    t.string "fff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "draft_team_id"
    t.bigint "team_id", null: false
    t.index ["draft_team_id"], name: "index_players_on_draft_team_id"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "shortname"
    t.datetime "founding_year"
    t.datetime "final_year"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_teams_on_team_id"
  end

  add_foreign_key "contract_ownership_periods", "contracts"
  add_foreign_key "contract_ownership_periods", "owners"
  add_foreign_key "contract_years", "contracts"
  add_foreign_key "contract_years", "owners"
end
