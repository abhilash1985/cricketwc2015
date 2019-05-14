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

ActiveRecord::Schema.define(version: 2019_05_13_193733) do

  create_table "challenge_payments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "challenge_id"
    t.integer "total_prize_amount"
    t.integer "winner_prize_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_challenge_payments_on_challenge_id"
    t.index ["user_id"], name: "index_challenge_payments_on_user_id"
  end

  create_table "challenges", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "tournament_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fee", default: 10
    t.index ["end_time"], name: "index_challenges_on_end_time"
    t.index ["fee"], name: "index_challenges_on_fee"
    t.index ["name"], name: "index_challenges_on_name"
    t.index ["start_time"], name: "index_challenges_on_start_time"
    t.index ["tournament_id"], name: "index_challenges_on_tournament_id"
  end

  create_table "match_questions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "match_id"
    t.integer "question_id"
    t.text "options"
    t.string "answer"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer"], name: "index_match_questions_on_answer"
    t.index ["match_id"], name: "index_match_questions_on_match_id"
    t.index ["points"], name: "index_match_questions_on_points"
    t.index ["question_id"], name: "index_match_questions_on_question_id"
  end

  create_table "matches", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "match_no"
    t.integer "team1_id"
    t.integer "team2_id"
    t.integer "stadium_id"
    t.integer "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "match_date"
    t.integer "round_id"
    t.integer "team1_score", default: 0
    t.integer "team2_score", default: 0
    t.string "won_in", default: "FT"
    t.index ["challenge_id"], name: "index_matches_on_challenge_id"
    t.index ["match_date"], name: "index_matches_on_match_date"
    t.index ["match_no"], name: "index_matches_on_match_no"
    t.index ["stadium_id"], name: "index_matches_on_stadium_id"
    t.index ["team1_id"], name: "index_matches_on_team1_id"
    t.index ["team2_id"], name: "index_matches_on_team2_id"
  end

  create_table "payments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "predictions"
    t.integer "paid_predictions"
    t.integer "amount_paid"
    t.integer "matches_won"
    t.integer "prize_won"
    t.integer "balance"
    t.integer "future_predictions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "players", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "team_id"
    t.date "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "player_style", default: "bat"
    t.index ["first_name"], name: "index_players_on_first_name"
    t.index ["last_name"], name: "index_players_on_last_name"
    t.index ["player_style"], name: "index_players_on_player_style"
  end

  create_table "predictions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_challenge_id"
    t.integer "match_question_id"
    t.string "user_answer"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_question_id"], name: "index_predictions_on_match_question_id"
    t.index ["points"], name: "index_predictions_on_points"
    t.index ["user_answer"], name: "index_predictions_on_user_answer"
    t.index ["user_challenge_id"], name: "index_predictions_on_user_challenge_id"
  end

  create_table "prizes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "prize_type"
    t.integer "user_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_prizes_on_user_id"
  end

  create_table "questions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weightage"
    t.index ["question"], name: "index_questions_on_question"
    t.index ["weightage"], name: "index_questions_on_weightage"
  end

  create_table "rounds", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_rounds_on_name"
  end

  create_table "stadia", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_stadia_on_name"
  end

  create_table "teams", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_name"
    t.string "flag"
    t.index ["name"], name: "index_teams_on_name"
    t.index ["short_name"], name: "index_teams_on_short_name"
  end

  create_table "tournament_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "game"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_tournament_types_on_active"
    t.index ["game"], name: "index_tournament_types_on_game"
    t.index ["name"], name: "index_tournament_types_on_name"
  end

  create_table "tournaments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tournament_type_id"
    t.index ["end_date"], name: "index_tournaments_on_end_date"
    t.index ["name"], name: "index_tournaments_on_name"
    t.index ["start_date"], name: "index_tournaments_on_start_date"
    t.index ["tournament_type_id"], name: "index_tournaments_on_tournament_type_id"
  end

  create_table "user_challenges", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "paid", default: false
    t.index ["challenge_id"], name: "index_user_challenges_on_challenge_id"
    t.index ["user_id"], name: "index_user_challenges_on_user_id"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "challenge_payments", "challenges"
  add_foreign_key "challenge_payments", "users"
  add_foreign_key "payments", "users"
  add_foreign_key "prizes", "users"
  add_foreign_key "tournaments", "tournament_types"
end
