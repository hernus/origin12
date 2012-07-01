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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120701043153) do

  create_table "companies", :force => true do |t|
    t.string   "key"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "key"
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "deleted_at"
  end

  create_table "employee_rates", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "team_id"
    t.float    "cost_rate"
    t.float    "card_rate"
    t.float    "internal_rate"
    t.date     "until"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "key"
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "employment_type_id"
    t.integer  "role_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "state"
    t.integer  "billing_capacity"
    t.date     "started_at"
    t.date     "terminated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.datetime "deleted_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "key"
    t.integer  "customer_id"
    t.integer  "parent_id"
    t.integer  "manager_id"
    t.string   "short_name"
    t.string   "name"
    t.string   "description"
    t.string   "state"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "deleted_at"
  end

  create_table "reasons", :force => true do |t|
    t.string   "key"
    t.integer  "company_id"
    t.string   "description"
    t.string   "color"
    t.string   "background_color"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.datetime "deleted_at"
  end

  create_table "rosters", :force => true do |t|
    t.string   "key"
    t.integer  "customer_id"
    t.integer  "project_id"
    t.date     "roster_date"
    t.integer  "shift"
    t.float    "hours"
    t.integer  "billing_probability"
    t.integer  "reason_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.datetime "deleted_at"
  end

  add_index "rosters", ["project_id"], :name => "index_rosters_on_project_id"
  add_index "rosters", ["roster_date"], :name => "index_rosters_on_roster_date"

  create_table "teams", :force => true do |t|
    t.string   "key"
    t.integer  "parent_id"
    t.integer  "manager_id"
    t.string   "description"
    t.string   "state"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "deleted_at"
  end

end
