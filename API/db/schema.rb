# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_04_153041) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.date "birth_date"
    t.string "weight"
    t.string "height"
    t.string "goal"
    t.string "time_active"
    t.string "availability"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
  end

  create_table "contracts", force: :cascade do |t|
    t.date "start_date"
    t.date "close_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "client_id", null: false
    t.integer "trainer_id", null: false
    t.index ["client_id"], name: "index_contracts_on_client_id"
    t.index ["trainer_id"], name: "index_contracts_on_trainer_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "equipment"
    t.integer "times"
    t.integer "training_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "series"
    t.index ["training_id"], name: "index_exercises_on_training_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.date "rating_date"
    t.float "rating_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "client_id", null: false
    t.integer "trainer_id", null: false
    t.index ["client_id"], name: "index_ratings_on_client_id"
    t.index ["trainer_id"], name: "index_ratings_on_trainer_id"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.date "birth_date"
    t.string "time_acting"
    t.string "qualifications"
    t.string "availability"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "price"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "kind"
    t.string "division"
    t.date "date_start"
    t.date "date_end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "client_id", null: false
    t.integer "trainer_id", null: false
    t.index ["client_id"], name: "index_trainings_on_client_id"
    t.index ["trainer_id"], name: "index_trainings_on_trainer_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "contracts", "clients"
  add_foreign_key "contracts", "trainers"
  add_foreign_key "exercises", "trainings"
  add_foreign_key "ratings", "clients"
  add_foreign_key "ratings", "trainers"
  add_foreign_key "trainings", "clients"
  add_foreign_key "trainings", "trainers"
end
