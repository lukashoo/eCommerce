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

ActiveRecord::Schema.define(version: 20151004235106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "apartment_building_id"
    t.string   "town_city"
    t.string   "street"
    t.string   "zip_postcode"
    t.string   "country"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "addresses", ["apartment_building_id"], name: "index_addresses_on_apartment_building_id", using: :btree
  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "apartment_buildings", force: :cascade do |t|
    t.string   "short_name",  default: "", null: false
    t.string   "full_name",   default: "", null: false
    t.string   "description"
    t.string   "manager"
    t.string   "phone"
    t.string   "other"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "apartment_facilities", force: :cascade do |t|
    t.integer  "facility_id"
    t.integer  "apartment_id"
    t.decimal  "number_units", precision: 6, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "apartment_facilities", ["apartment_id"], name: "index_apartment_facilities_on_apartment_id", using: :btree
  add_index "apartment_facilities", ["facility_id"], name: "index_apartment_facilities_on_facility_id", using: :btree

  create_table "apartment_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "apartments", force: :cascade do |t|
    t.integer  "apartment_building_id"
    t.integer  "apartment_type_id"
    t.decimal  "bathroom_count",        precision: 2
    t.decimal  "bedroom_count",         precision: 2
    t.decimal  "room_count",            precision: 2
    t.string   "other"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id_1"
    t.integer  "user_id_2"
    t.integer  "apt_number"
    t.string   "image"
  end

  add_index "apartments", ["apartment_building_id"], name: "index_apartments_on_apartment_building_id", using: :btree
  add_index "apartments", ["apartment_type_id"], name: "index_apartments_on_apartment_type_id", using: :btree

  create_table "charges", force: :cascade do |t|
    t.integer  "invoice_id"
    t.string   "email"
    t.datetime "date"
    t.decimal  "sum",        precision: 7, scale: 2
    t.string   "card_token"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
  end

  add_index "charges", ["invoice_id"], name: "index_charges_on_invoice_id", using: :btree

  create_table "facilities", force: :cascade do |t|
    t.integer  "apartment_building_id"
    t.integer  "apartment_type_id"
    t.string   "description"
    t.decimal  "prize_unit",            precision: 5, scale: 2
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "facilities", ["apartment_building_id"], name: "index_facilities_on_apartment_building_id", using: :btree
  add_index "facilities", ["apartment_type_id"], name: "index_facilities_on_apartment_type_id", using: :btree

  create_table "invoice_items", force: :cascade do |t|
    t.integer  "invoice_id"
    t.integer  "apartment_facility_id"
    t.string   "facility_description"
    t.decimal  "number_units",          precision: 6, scale: 2
    t.decimal  "prize_unit",            precision: 5, scale: 2
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "invoice_items", ["apartment_facility_id"], name: "index_invoice_items_on_apartment_facility_id", using: :btree
  add_index "invoice_items", ["invoice_id"], name: "index_invoice_items_on_invoice_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.integer  "apartment_id"
    t.datetime "date"
    t.decimal  "sum",            precision: 7, scale: 2
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.boolean  "status",                                 default: true
    t.string   "number"
    t.datetime "pay_date"
    t.datetime "operation_date"
  end

  add_index "invoices", ["apartment_id"], name: "index_invoices_on_apartment_id", using: :btree

  create_table "user_apartment_histories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "apartment_id"
    t.integer  "ownership_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "user_apartment_histories", ["apartment_id"], name: "index_user_apartment_histories_on_apartment_id", using: :btree
  add_index "user_apartment_histories", ["user_id"], name: "index_user_apartment_histories_on_user_id", using: :btree

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
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "surname"
    t.string   "other"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "apartments", "users", column: "user_id_1"
  add_foreign_key "apartments", "users", column: "user_id_2"
  add_foreign_key "charges", "users"
end
