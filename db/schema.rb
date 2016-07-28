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

ActiveRecord::Schema.define(version: 20160728063904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "nombre"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "atendees", force: :cascade do |t|
    t.string   "nombre"
    t.string   "email"
    t.integer  "workshop_id"
    t.integer  "visit_id"
    t.datetime "fecha_registro"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "universidad"
    t.string   "registration_code"
    t.boolean  "confirmado",         default: false
    t.datetime "hora_asignada"
    t.string   "recovery_code"
    t.boolean  "pase_diario",        default: false
  end

  add_index "atendees", ["visit_id"], name: "index_atendees_on_visit_id", using: :btree
  add_index "atendees", ["workshop_id"], name: "index_atendees_on_workshop_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "visits", force: :cascade do |t|
    t.text     "descripcion"
    t.string   "empresa"
    t.string   "lugar"
    t.datetime "fecha"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "cupo_actual"
    t.integer  "cupo_maximo"
    t.integer  "asistentes_registrados"
    t.string   "duracion"
  end

  create_table "workshops", force: :cascade do |t|
    t.string   "representante"
    t.text     "descripcion"
    t.string   "tipo"
    t.string   "lugar"
    t.datetime "fecha"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "cupo_actual"
    t.integer  "cupo_maximo"
    t.integer  "asistentes_registrados"
    t.string   "duracion"
  end

end
