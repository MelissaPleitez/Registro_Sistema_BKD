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

ActiveRecord::Schema[7.1].define(version: 2024_05_23_121508) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audit_logs", force: :cascade do |t|
    t.bigint "authentication_id", null: false
    t.bigint "customer_id", null: false
    t.integer "action"
    t.string "changes_client"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authentication_id"], name: "index_audit_logs_on_authentication_id"
    t.index ["customer_id"], name: "index_audit_logs_on_customer_id"
  end

  create_table "authentications", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti"
    t.index ["email"], name: "index_authentications_on_email", unique: true
    t.index ["jti"], name: "index_authentications_on_jti"
    t.index ["reset_password_token"], name: "index_authentications_on_reset_password_token", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "client_email"
    t.string "tel_number"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "customer_directions", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_directions_on_customer_id"
  end

  create_table "customer_identifications", force: :cascade do |t|
    t.string "identification_type"
    t.string "identification_number"
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_identifications_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "client_email"
    t.string "tel_number"
    t.bigint "authentication_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authentication_id"], name: "index_customers_on_authentication_id"
  end

  create_table "directions", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "postal_code"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_directions_on_client_id"
  end

  create_table "identifications", force: :cascade do |t|
    t.string "identification_number"
    t.string "breadcast_date"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_identifications_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "audit_logs", "authentications"
  add_foreign_key "audit_logs", "customers"
  add_foreign_key "clients", "users"
  add_foreign_key "customer_directions", "customers"
  add_foreign_key "customer_identifications", "customers"
  add_foreign_key "customers", "authentications"
  add_foreign_key "directions", "clients"
  add_foreign_key "identifications", "clients"
end
