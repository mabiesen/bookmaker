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

ActiveRecord::Schema[7.1].define(version: 2024_03_14_190930) do
  create_table "snippets", force: :cascade do |t|
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "study_authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name", "last_name"], name: "index_study_authors_on_first_name_and_last_name", unique: true
  end

  create_table "study_authors_books", id: false, force: :cascade do |t|
    t.integer "study_author_id", null: false
    t.integer "study_book_id", null: false
  end

  create_table "study_books", force: :cascade do |t|
    t.string "title"
    t.text "summary"
    t.integer "number_of_pages"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "study_notes", force: :cascade do |t|
    t.integer "study_book_id", null: false
    t.integer "page_number"
    t.text "note_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_book_id"], name: "index_study_notes_on_study_book_id"
  end

  add_foreign_key "study_notes", "study_books"
end
