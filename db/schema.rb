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

ActiveRecord::Schema[7.1].define(version: 2023_11_11_163340) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "citizens", force: :cascade do |t|
    t.string "full_name"
    t.string "document_number"
    t.string "cns"
    t.string "email"
    t.integer "status"
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cns"], name: "index_citizens_on_cns"
    t.index ["document_number"], name: "index_citizens_on_document_number"
    t.index ["email"], name: "index_citizens_on_email"
    t.index ["full_name"], name: "index_citizens_on_full_name"
  end

end
