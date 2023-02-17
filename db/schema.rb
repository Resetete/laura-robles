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

ActiveRecord::Schema[7.0].define(version: 2023_02_17_150125) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_contents", force: :cascade do |t|
    t.json "part_1"
    t.json "part_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "news_contents", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "date", null: false
    t.text "content", null: false
    t.string "social_media_permalink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects_tables", force: :cascade do |t|
    t.text "title_en"
    t.text "title_es"
    t.text "title_de"
    t.text "description_en"
    t.text "description_es"
    t.text "description_de"
    t.text "music_url"
    t.text "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
