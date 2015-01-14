ActiveRecord::Schema.define(version: 20150113212008) do

  enable_extension "plpgsql"

  create_table "cost_objects", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "kit_orders", force: :cascade do |t|
    t.integer "order_id",    null: false
    t.integer "kit_id",      null: false
    t.integer "amount",      null: false
    t.string  "name",        null: false
    t.text    "lot_numbers"
  end

  create_table "kits", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "machine_kit_compatibilities", force: :cascade do |t|
    t.integer "kit_id",     null: false
    t.integer "machine_id", null: false
  end

  create_table "machines", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "needed_by",                        null: false
    t.string   "status",         default: "To Do", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "machine_id",                       null: false
    t.integer  "cost_object_id",                   null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
