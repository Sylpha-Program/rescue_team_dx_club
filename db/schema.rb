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

ActiveRecord::Schema.define(version: 2021_12_05_053526) do

  create_table "pokemons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "number"
    t.string "name"
    t.bigint "type_1_id"
    t.bigint "type_2_id"
    t.string "ability"
    t.bigint "quality_id"
    t.string "move_1_name"
    t.bigint "move_1_type_id"
    t.string "move_2_name"
    t.bigint "move_2_type_id"
    t.string "move_3_name"
    t.bigint "move_3_type_id"
    t.string "move_4_name"
    t.bigint "move_4_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["move_1_type_id"], name: "index_pokemons_on_move_1_type_id"
    t.index ["move_2_type_id"], name: "index_pokemons_on_move_2_type_id"
    t.index ["move_3_type_id"], name: "index_pokemons_on_move_3_type_id"
    t.index ["move_4_type_id"], name: "index_pokemons_on_move_4_type_id"
    t.index ["quality_id"], name: "index_pokemons_on_quality_id"
    t.index ["type_1_id"], name: "index_pokemons_on_type_1_id"
    t.index ["type_2_id"], name: "index_pokemons_on_type_2_id"
    t.index ["user_id"], name: "index_pokemons_on_user_id"
  end

  create_table "qualities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pokemons", "qualities"
  add_foreign_key "pokemons", "types", column: "move_1_type_id"
  add_foreign_key "pokemons", "types", column: "move_2_type_id"
  add_foreign_key "pokemons", "types", column: "move_3_type_id"
  add_foreign_key "pokemons", "types", column: "move_4_type_id"
  add_foreign_key "pokemons", "types", column: "type_1_id"
  add_foreign_key "pokemons", "types", column: "type_2_id"
  add_foreign_key "pokemons", "users"
end
