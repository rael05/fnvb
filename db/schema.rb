# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_25_053939) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "announcement_translations", force: :cascade do |t|
    t.bigint "announcement_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["announcement_id"], name: "index_announcement_translations_on_announcement_id"
    t.index ["locale"], name: "index_announcement_translations_on_locale"
  end

  create_table "announcements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "article_translations", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["article_id"], name: "index_article_translations_on_article_id"
    t.index ["locale"], name: "index_article_translations_on_locale"
  end

  create_table "articles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "statistic_translations", force: :cascade do |t|
    t.bigint "statistic_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["locale"], name: "index_statistic_translations_on_locale"
    t.index ["statistic_id"], name: "index_statistic_translations_on_statistic_id"
  end

  create_table "statistics", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_statistics_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.string "team_name", null: false
    t.string "color_shirt1", null: false
    t.string "color_short1", null: false
    t.string "color_shirt2"
    t.string "color_short2"
    t.string "color_shirt3"
    t.string "color_short3"
    t.string "delegate_name"
    t.string "delegate_last_name"
    t.string "head_coach_name", null: false
    t.string "head_coach_last_name", null: false
    t.string "assistant_coach1_name", null: false
    t.string "assistant_coach1_last_name", null: false
    t.string "assistant_coach2_name"
    t.string "assistant_coach2_last_name"
    t.string "doctor_name"
    t.string "doctor_last_name"
    t.string "physiotherapist_name"
    t.string "physiotherapist_last_name"
    t.string "statistical_name"
    t.string "statistical_last_name"
    t.string "international_referee_name"
    t.string "international_referee_last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_teams_on_tournament_id"
  end

  create_table "tournament_translations", force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.index ["locale"], name: "index_tournament_translations_on_locale"
    t.index ["tournament_id"], name: "index_tournament_translations_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.boolean "international"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tournament_id"
    t.string "permission", limit: 1, default: "G"
    t.bigint "team_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
    t.index ["tournament_id"], name: "index_users_on_tournament_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "announcements", "users"
  add_foreign_key "articles", "users"
  add_foreign_key "statistics", "users"
  add_foreign_key "teams", "tournaments"
  add_foreign_key "users", "teams"
  add_foreign_key "users", "tournaments"
end
