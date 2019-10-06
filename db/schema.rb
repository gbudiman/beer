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

ActiveRecord::Schema.define(version: 20_191_005_015_922) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'branch_locations', force: :cascade do |t|
    t.bigint 'branch_id'
    t.bigint 'location_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[branch_id location_id], name: 'index_branch_locations_on_branch_id_and_location_id', unique: true
    t.index ['branch_id'], name: 'index_branch_locations_on_branch_id'
    t.index ['location_id'], name: 'index_branch_locations_on_location_id'
  end

  create_table 'branches', force: :cascade do |t|
    t.integer 'state', default: 0, null: false
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[state name], name: 'index_branches_on_state_and_name', unique: true
  end

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

  create_table 'events', force: :cascade do |t|
    t.datetime 'start', null: false
    t.datetime 'end', null: false
    t.string 'name', null: false
    t.bigint 'branch_id'
    t.bigint 'location_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[branch_id location_id start], name: 'index_events_on_branch_id_and_location_id_and_start', unique: true
    t.index ['branch_id'], name: 'index_events_on_branch_id'
    t.index ['location_id'], name: 'index_events_on_location_id'
    t.index ['start'], name: 'index_events_on_start'
  end

  create_table 'locations', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'state', default: 0, null: false
    t.string 'address', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[state address], name: 'index_locations_on_state_and_address', unique: true
  end

  create_table 'players', force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.integer 'player_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
