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

ActiveRecord::Schema.define(version: 20150426164321) do

  create_table "accounts", force: true do |t|
    t.string   "details"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comments"
    t.string   "address1"
    t.string   "address2"
  end

  add_index "accounts", ["employee_id"], name: "index_accounts_on_employee_id"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "manager"
    t.string   "status"
    t.integer  "terms"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "department_name"
    t.string   "manager"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "phone"
    t.string   "job_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
    t.datetime "date_of_hire"
    t.integer  "vacation_days"
    t.string   "status"
    t.text     "department"
    t.string   "manager"
    t.decimal  "salary"
  end

  create_table "invoices", force: true do |t|
    t.datetime "date"
    t.string   "company"
    t.decimal  "tax"
    t.string   "salesperson"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status_type"
    t.string   "address1"
  end

  create_table "region_compensations", force: true do |t|
    t.string   "region_name"
    t.string   "country_name"
    t.string   "state"
    t.decimal  "number_of_employees"
    t.decimal  "salary_total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
