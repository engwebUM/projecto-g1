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

ActiveRecord::Schema.define(version: 20150608152955) do

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.integer  "slots"
    t.float    "price"
    t.integer  "tickets"
    t.float    "discount_coupon"
    t.integer  "discount_tickets"
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "organization"
    t.string   "person_name"
    t.string   "person_role"
    t.string   "person_email"
    t.string   "person_phone"
    t.float    "extra_pay"
    t.string   "next_step"
    t.text     "notes"
    t.integer  "user_id"
    t.integer  "plan_id"
    t.integer  "state_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "sponsors", ["plan_id"], name: "index_sponsors_on_plan_id"
  add_index "sponsors", ["state_id"], name: "index_sponsors_on_state_id"
  add_index "sponsors", ["user_id"], name: "index_sponsors_on_user_id"

  create_table "states", force: :cascade do |t|
    t.string   "name",                       null: false
    t.boolean  "is_final",   default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "states", ["is_final"], name: "index_states_on_is_final"
  add_index "states", ["name"], name: "index_states_on_name"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
