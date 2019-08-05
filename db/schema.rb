# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_190_805_005_150) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'characters', force: :cascade do |t|
    t.bigint 'player_id'
    t.string 'name', null: false
    t.integer 'status', default: 0, null: false
    t.integer 'xp_legacy', default: 0, null: false
    t.integer 'xp_earned', default: 0, null: false
    t.integer 'body', default: 0, null: false
    t.integer 'mind', default: 0, null: false
    t.integer 'resolve', default: 0, null: false
    t.integer 'infection', default: 0, null: false
    t.integer 'death', default: 0, null: false
    t.integer 'strain_id', default: 0, null: false
    t.integer 'faith_id', default: 0, null: false
    t.integer 'skill_ids', default: [], null: false, array: true
    t.integer 'lore_ids', default: [], null: false, array: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['player_id'], name: 'index_characters_on_player_id'
  end

  create_table 'players', force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.integer 'player_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end