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

ActiveRecord::Schema.define(version: 2018_10_12_021818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "barrios", force: :cascade do |t|
    t.string "descripcion"
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_descrip"
    t.boolean "category_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ciudades", force: :cascade do |t|
    t.string "descripcion"
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ciudads", force: :cascade do |t|
    t.string "ciu_descrip"
    t.boolean "ciu_activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "n_cedula"
    t.string "cli_telefono"
    t.integer "limite_credito"
    t.boolean "cli_activo"
    t.bigint "ciudades_id"
    t.bigint "barrio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barrio_id"], name: "index_clientes_on_barrio_id"
    t.index ["ciudades_id"], name: "index_clientes_on_ciudades_id"
  end

  create_table "marcas", force: :cascade do |t|
    t.string "marca_descrip"
    t.boolean "marca_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos", force: :cascade do |t|
    t.string "prod_descrip"
    t.integer "iva"
    t.boolean "prod_active"
    t.bigint "proveedore_id"
    t.bigint "marca_id"
    t.bigint "sub_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marca_id"], name: "index_productos_on_marca_id"
    t.index ["proveedore_id"], name: "index_productos_on_proveedore_id"
    t.index ["sub_category_id"], name: "index_productos_on_sub_category_id"
  end

  create_table "proveedores", force: :cascade do |t|
    t.string "razon_social"
    t.string "ruc"
    t.string "direccion"
    t.string "telefono"
    t.string "email"
    t.boolean "prov_activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.bigint "producto_id"
    t.bigint "sucursale_id"
    t.float "precio_venta"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producto_id"], name: "index_stocks_on_producto_id"
    t.index ["sucursale_id"], name: "index_stocks_on_sucursale_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "sub_categ_descrip"
    t.boolean "sub_categ_active"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "sucursales", force: :cascade do |t|
    t.string "suc_descrip"
    t.boolean "suc_activo"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clientes", "barrios"
  add_foreign_key "clientes", "ciudades", column: "ciudades_id"
  add_foreign_key "productos", "marcas"
  add_foreign_key "productos", "proveedores"
  add_foreign_key "productos", "sub_categories"
  add_foreign_key "stocks", "productos"
  add_foreign_key "stocks", "sucursales"
  add_foreign_key "sub_categories", "categories"
end
