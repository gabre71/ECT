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

ActiveRecord::Schema.define(:version => 20130205130959) do

  create_table "app_data", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "app_moduls", :force => true do |t|
    t.integer  "app_data_id"
    t.integer  "modul_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "app_moduls", ["app_data_id"], :name => "index_app_moduls_on_app_data_id"
  add_index "app_moduls", ["modul_id"], :name => "index_app_moduls_on_modul_id"

  create_table "moduls", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "planned_holidays", :force => true do |t|
    t.integer  "user_id",         :null => false
    t.date     "term_start"
    t.date     "term_end"
    t.integer  "approver_id"
    t.integer  "holiday_type_id", :null => false
    t.string   "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "planned_holidays", ["approver_id"], :name => "index_planned_holidays_on_approver_id"
  add_index "planned_holidays", ["holiday_type_id"], :name => "index_planned_holidays_on_holiday_type_id"
  add_index "planned_holidays", ["user_id"], :name => "index_planned_holidays_on_user_id"

  create_table "planned_work_times", :force => true do |t|
    t.integer  "user_id"
    t.date     "from_date"
    t.date     "to_date"
    t.integer  "time_frame_id"
    t.integer  "work_site_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "planned_work_times", ["time_frame_id"], :name => "index_planned_work_times_on_time_frame_id"
  add_index "planned_work_times", ["user_id"], :name => "index_planned_work_times_on_user_id"
  add_index "planned_work_times", ["work_site_id"], :name => "index_planned_work_times_on_work_site_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "time_frames", :force => true do |t|
    t.string   "name",                             :null => false
    t.time     "from_time",                        :null => false
    t.time     "to_time",                          :null => false
    t.time     "cc_start_time"
    t.time     "cc_end_time"
    t.boolean  "inactive",      :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "time_sheets", :force => true do |t|
    t.integer  "user_id",              :null => false
    t.date     "work_date",            :null => false
    t.integer  "planned_work_time_id"
    t.integer  "planned_holiday_id"
    t.integer  "work_site_id"
    t.time     "start_time"
    t.time     "end_time"
    t.time     "cc_start_time"
    t.time     "cc_end_time"
    t.boolean  "lateness"
    t.integer  "work_time_type_id",    :null => false
    t.integer  "time_frame_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "time_sheets", ["planned_work_time_id"], :name => "index_time_sheets_on_planned_work_time_id"
  add_index "time_sheets", ["time_frame_id"], :name => "index_time_sheets_on_time_frame_id"
  add_index "time_sheets", ["user_id"], :name => "index_time_sheets_on_user_id"
  add_index "time_sheets", ["work_site_id"], :name => "index_time_sheets_on_work_site_id"
  add_index "time_sheets", ["work_time_type_id"], :name => "index_time_sheets_on_work_time_type_id"

  create_table "user_holidays", :force => true do |t|
    t.integer  "user_id",                             :null => false
    t.string   "year",                                :null => false
    t.integer  "holidays",             :default => 0
    t.integer  "accepted",             :default => 0
    t.integer  "planned",              :default => 0
    t.integer  "waiting",              :default => 0
    t.integer  "accepted_sick_leaves", :default => 0
    t.integer  "rejected_sick_leaves", :default => 0
    t.integer  "waiting_sick_leaves",  :default => 0
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "user_holidays", ["user_id"], :name => "index_user_holidays_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "username",                               :null => false
    t.string   "skype"
    t.string   "phone"
    t.integer  "manager_id"
    t.integer  "deputy_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["deputy_id"], :name => "index_users_on_deputy_id"
  add_index "users", ["manager_id"], :name => "index_users_on_manager_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "work_sites", :force => true do |t|
    t.string   "name",                      :null => false
    t.integer  "distance",   :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "work_time_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
