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

ActiveRecord::Schema.define(version: 20170512111909768677) do

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

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "cars", force: :cascade do |t|
    t.string   "make"
    t.string   "model"
    t.string   "engine"
    t.string   "registration_no"
    t.string   "vin"
    t.string   "actual_mileage"
    t.string   "yearly_mileage"
    t.integer  "driving_profile"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "lit_incomming_localizations", force: :cascade do |t|
    t.text     "translated_value"
    t.integer  "locale_id"
    t.integer  "localization_key_id"
    t.integer  "localization_id"
    t.string   "locale_str"
    t.string   "localization_key_str"
    t.integer  "source_id"
    t.integer  "incomming_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lit_incomming_localizations", ["incomming_id"], name: "index_lit_incomming_localizations_on_incomming_id", using: :btree
  add_index "lit_incomming_localizations", ["locale_id"], name: "index_lit_incomming_localizations_on_locale_id", using: :btree
  add_index "lit_incomming_localizations", ["localization_id"], name: "index_lit_incomming_localizations_on_localization_id", using: :btree
  add_index "lit_incomming_localizations", ["localization_key_id"], name: "index_lit_incomming_localizations_on_localization_key_id", using: :btree
  add_index "lit_incomming_localizations", ["source_id"], name: "index_lit_incomming_localizations_on_source_id", using: :btree

  create_table "lit_locales", force: :cascade do |t|
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_hidden",  default: false
  end

  create_table "lit_localization_keys", force: :cascade do |t|
    t.string   "localization_key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_completed",     default: false
    t.boolean  "is_starred",       default: false
  end

  add_index "lit_localization_keys", ["localization_key"], name: "index_lit_localization_keys_on_localization_key", unique: true, using: :btree

  create_table "lit_localization_versions", force: :cascade do |t|
    t.text     "translated_value"
    t.integer  "localization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lit_localization_versions", ["localization_id"], name: "index_lit_localization_versions_on_localization_id", using: :btree

  create_table "lit_localizations", force: :cascade do |t|
    t.integer  "locale_id"
    t.integer  "localization_key_id"
    t.text     "default_value"
    t.text     "translated_value"
    t.boolean  "is_changed",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lit_localizations", ["locale_id"], name: "index_lit_localizations_on_locale_id", using: :btree
  add_index "lit_localizations", ["localization_key_id"], name: "index_lit_localizations_on_localization_key_id", using: :btree

  create_table "lit_sources", force: :cascade do |t|
    t.string   "identifier"
    t.string   "url"
    t.string   "api_key"
    t.datetime "last_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "link"
  end

  create_table "tolk_locales", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tolk_locales", ["name"], name: "index_tolk_locales_on_name", unique: true, using: :btree

  create_table "tolk_phrases", force: :cascade do |t|
    t.text     "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tolk_translations", force: :cascade do |t|
    t.integer  "phrase_id"
    t.integer  "locale_id"
    t.text     "text"
    t.text     "previous_text"
    t.boolean  "primary_updated", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tolk_translations", ["phrase_id", "locale_id"], name: "index_tolk_translations_on_phrase_id_and_locale_id", unique: true, using: :btree

  create_table "translation_center_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "translation_center_translation_keys", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "last_accessed"
    t.string   "en_status",     default: "untranslated"
    t.string   "pl_status",     default: "untranslated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "translation_center_translation_keys", ["name"], name: "index_translation_center_translation_keys_on_name", using: :btree

  create_table "translation_center_translations", force: :cascade do |t|
    t.integer  "translation_key_id"
    t.text     "value"
    t.string   "lang"
    t.integer  "translator_id"
    t.string   "translator_type"
    t.string   "status",             default: "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "translation_center_translations", ["translation_key_id"], name: "index_translation_center_translations_on_translation_key_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "gender"
    t.string   "location"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
