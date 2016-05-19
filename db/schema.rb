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

ActiveRecord::Schema.define(version: 20160518212254) do

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

  create_table "carriages", id: false, force: :cascade do |t|
    t.integer "train_number",                                                            null: false
    t.integer "id_carriage",  default: "nextval('carriages_id_carriage_seq'::regclass)", null: false
  end

  create_table "flights", primary_key: "id_flight", force: :cascade do |t|
    t.integer "id_route",     null: false
    t.integer "train_number", null: false
  end

  create_table "places", id: false, force: :cascade do |t|
    t.integer "train_number",                                                   null: false
    t.integer "id_carriage",                                                    null: false
    t.integer "place",        default: "nextval('places_place_seq'::regclass)", null: false
    t.integer "id_place",                                                       null: false
    t.integer "id_ticket",                                                      null: false
  end

  add_index "places", ["id_place"], name: "places_id_place_key", unique: true, using: :btree

  create_table "routes", primary_key: "id_route", force: :cascade do |t|
    t.string "region", null: false
    t.string "city",   null: false
  end

  create_table "stations", primary_key: "id_station", force: :cascade do |t|
    t.string "name_station", null: false
  end

  create_table "stops", id: false, force: :cascade do |t|
    t.integer "id_route",                                                      null: false
    t.integer "id_stop",    default: "nextval('stops_id_stop_seq'::regclass)", null: false
    t.integer "id_station",                                                    null: false
    t.boolean "transit"
  end

  create_table "tickets", primary_key: "id_ticket", force: :cascade do |t|
    t.integer "id_place",                   null: false
    t.integer "id_route",                   null: false
    t.integer "id_station",                 null: false
    t.integer "stat_id_station",            null: false
    t.integer "id_flight",                  null: false
    t.date    "date_arrival",               null: false
    t.date    "date_dispatch",              null: false
    t.integer "password_number",            null: false
    t.string  "full_name",       limit: 80, null: false
  end

  create_table "trains", primary_key: "train_number", force: :cascade do |t|
  end

  add_foreign_key "carriages", "trains", column: "train_number", primary_key: "train_number", name: "fk_carr_train"
  add_foreign_key "flights", "routes", column: "id_route", primary_key: "id_route", name: "fk_flights_routes"
  add_foreign_key "flights", "trains", column: "train_number", primary_key: "train_number", name: "fk_flights_trains"
  add_foreign_key "stops", "routes", column: "id_route", primary_key: "id_route", name: "fk_stops_routes"
  add_foreign_key "stops", "stations", column: "id_station", primary_key: "id_station", name: "fk_stops_stations"
  add_foreign_key "tickets", "flights", column: "id_flight", primary_key: "id_flight", name: "fk_tickets_flights"
  add_foreign_key "tickets", "places", column: "id_place", primary_key: "id_place", name: "fk_tickets_places"
  add_foreign_key "tickets", "stations", column: "id_station", primary_key: "id_station", name: "fk_tickets_station_arrival"
  add_foreign_key "tickets", "stations", column: "stat_id_station", primary_key: "id_station", name: "fk_tickets_station_departure"
end
