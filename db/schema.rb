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

ActiveRecord::Schema.define(:version => 20130722025946) do

  create_table "app_activity_logs", :force => true do |t|
    t.integer  "app_id"
    t.integer  "user_id"
    t.string   "controller"
    t.string   "action"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "app_oauth_scopes", :force => true do |t|
    t.integer  "app_id"
    t.integer  "oauth_scope_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "app_oauth_scopes", ["app_id"], :name => "index_app_oauth_scopes_on_app_id"
  add_index "app_oauth_scopes", ["oauth_scope_id"], :name => "index_app_oauth_scopes_on_oauth_scope_id"

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "slug"
    t.text     "description"
    t.string   "short_description"
    t.string   "url"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "user_id"
    t.boolean  "is_public",         :default => false
  end

  add_index "apps", ["slug"], :name => "index_apps_on_slug"

  create_table "authentications", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.text     "data"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authentications", ["uid", "provider"], :name => "index_authentications_on_uid_and_provider"
  add_index "authentications", ["user_id"], :name => "index_authentications_on_user_id"

  create_table "beta_signups", :force => true do |t|
    t.string   "email"
    t.string   "ip_address"
    t.string   "referrer"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "is_approved", :default => false
  end

  create_table "filled_forms", :force => true do |t|
    t.integer  "form_id"
    t.integer  "user_id"
    t.integer  "app_id"
    t.text     "values"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "filled_forms", ["form_id"], :name => "index_filled_forms_on_form_id"
  add_index "filled_forms", ["user_id"], :name => "index_filled_forms_on_user_id"

  create_table "form_fields", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.text     "description"
    t.string   "values"
    t.integer  "form_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "forms", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.string   "agency"
    t.string   "landing_page_url"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "notifications", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.datetime "received_at"
    t.integer  "app_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "deleted_at"
    t.datetime "viewed_at"
  end

  add_index "notifications", ["app_id"], :name => "index_messages_on_o_auth2_model_client_id"
  add_index "notifications", ["app_id"], :name => "index_notifications_on_app_id"
  add_index "notifications", ["deleted_at"], :name => "index_notifications_on_deleted_at"
  add_index "notifications", ["user_id"], :name => "index_messages_on_user_id"

  create_table "oauth2_authorizations", :force => true do |t|
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "oauth2_resource_owner_type"
    t.integer  "oauth2_resource_owner_id"
    t.integer  "client_id"
    t.string   "scope"
    t.string   "code",                       :limit => 40
    t.string   "access_token_hash",          :limit => 40
    t.string   "refresh_token_hash",         :limit => 40
    t.datetime "expires_at"
  end

  add_index "oauth2_authorizations", ["access_token_hash"], :name => "index_oauth2_authorizations_on_access_token_hash"
  add_index "oauth2_authorizations", ["client_id", "access_token_hash"], :name => "index_oauth2_authorizations_on_client_id_and_access_token_hash"
  add_index "oauth2_authorizations", ["client_id", "code"], :name => "index_oauth2_authorizations_on_client_id_and_code"
  add_index "oauth2_authorizations", ["client_id", "refresh_token_hash"], :name => "index_oauth2_authorizations_on_client_id_and_refresh_token_hash"

  create_table "oauth2_clients", :force => true do |t|
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "oauth2_client_owner_type"
    t.integer  "oauth2_client_owner_id"
    t.string   "name"
    t.string   "client_id"
    t.string   "client_secret_hash"
    t.string   "redirect_uri"
  end

  add_index "oauth2_clients", ["client_id"], :name => "index_oauth2_clients_on_client_id"

  create_table "oauth_scopes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "scope_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "oauth_scopes", ["scope_name"], :name => "index_oauth_scopes_on_scope_name"

  create_table "related_urls", :force => true do |t|
    t.string   "url"
    t.string   "other_url"
    t.integer  "occurence_count", :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "related_urls", ["url", "occurence_count"], :name => "index_related_urls_on_url_and_occurence_count"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "submitted_forms", :force => true do |t|
    t.integer  "user_id"
    t.integer  "app_id"
    t.string   "form_number"
    t.string   "data_url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "submitted_forms", ["app_id"], :name => "index_submitted_forms_on_app_id"
  add_index "submitted_forms", ["user_id"], :name => "index_submitted_forms_on_user_id"

  create_table "task_items", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "completed_at"
    t.integer  "task_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "task_items", ["task_id"], :name => "index_task_items_on_task_id"

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.datetime "completed_at"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "app_id"
  end

  add_index "tasks", ["app_id"], :name => "index_tasks_on_app_id"
  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "uid"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["uid"], :name => "index_users_on_uid_and_provider", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
