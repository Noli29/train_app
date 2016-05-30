# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160518214406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "carriages", primary_key: "id_carriage", force: :cascade do |t|
    t.integer "id_flight"
    t.integer "carriage"
  end

  create_table "flights", primary_key: "id_flight", force: :cascade do |t|
    t.integer "id_train"
    t.date    "date_start"
  end

  create_table "flightstation", id: false, force: :cascade do |t|
    t.integer  "id_flight"
    t.integer  "id_station"
    t.datetime "date_arrive"
    t.datetime "date_departure"
    t.integer  "sort_order"
  end

  create_table "places", primary_key: "id_place", force: :cascade do |t|
    t.integer "id_carriage"
    t.boolean "is_unavailable", default: false
    t.integer "place"
  end

  create_table "routes", primary_key: "id_route", force: :cascade do |t|
    t.string "region"
    t.string "city"
  end

  create_table "stations", primary_key: "id_station", force: :cascade do |t|
    t.string  "name_station"
    t.integer "id_route"
  end

  create_table "stops", primary_key: "id_stop", force: :cascade do |t|
    t.integer "id_train"
    t.integer "id_station"
    t.time    "date_arrive"
    t.time    "date_departure"
    t.integer "day_from_departure"
    t.boolean "transit"
    t.integer "sort_order"
  end

  create_table "tickets", primary_key: "id_ticket", force: :cascade do |t|
    t.integer "id_place"
    t.integer "id_flight"
    t.integer "id_station"
    t.integer "stat_id_station"
    t.date    "date_arrival"
    t.date    "date_dispatch"
    t.string  "passport_number", limit: 8
    t.string  "full_name",       limit: 80
  end

  create_table "trains", primary_key: "id_train", force: :cascade do |t|
    t.integer "train_number"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "carriages", "flights", column: "id_flight", primary_key: "id_flight", name: "fk_carriages_train", on_delete: :cascade
  add_foreign_key "flights", "trains", column: "id_train", primary_key: "id_train", name: "fk_flights_train"
  add_foreign_key "flightstation", "flights", column: "id_flight", primary_key: "id_flight", name: "fk_flight_station_flight", on_delete: :cascade
  add_foreign_key "flightstation", "stations", column: "id_station", primary_key: "id_station", name: "fk_flight_station_station", on_delete: :cascade
  add_foreign_key "places", "carriages", column: "id_carriage", primary_key: "id_carriage", name: "fk_places_carriage", on_delete: :cascade
  add_foreign_key "stations", "routes", column: "id_route", primary_key: "id_route", name: "fk_stations_route", on_delete: :cascade
  add_foreign_key "stops", "stations", column: "id_station", primary_key: "id_station", name: "fk_stops_station"
  add_foreign_key "stops", "trains", column: "id_train", primary_key: "id_train", name: "fk_stops_train"
  add_foreign_key "tickets", "flights", column: "id_flight", primary_key: "id_flight", name: "fk_tickets_flight"
  add_foreign_key "tickets", "places", column: "id_place", primary_key: "id_place", name: "fk_tickets_place", on_delete: :nullify
  add_foreign_key "tickets", "stations", column: "id_station", primary_key: "id_station", name: "fk_tickets_station", on_delete: :nullify
  add_foreign_key "tickets", "stations", column: "stat_id_station", primary_key: "id_station", name: "fk_tickets_station_dep", on_delete: :nullify
end
