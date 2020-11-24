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

ActiveRecord::Schema.define(version: 2020_11_24_060405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.bigint "province_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_cities_on_province_id"
  end

  create_table "consignees", force: :cascade do |t|
    t.bigint "province_id"
    t.bigint "city_id"
    t.bigint "district_id"
    t.string "name"
    t.string "phone_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_consignees_on_city_id"
    t.index ["district_id"], name: "index_consignees_on_district_id"
    t.index ["province_id"], name: "index_consignees_on_province_id"
  end

  create_table "districts", force: :cascade do |t|
    t.bigint "city_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_districts_on_city_id"
  end

  create_table "fares", force: :cascade do |t|
    t.string "service_code"
    t.bigint "origin_id"
    t.bigint "destination_id"
    t.decimal "amount"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", id: false, force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "estimation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipment_items", force: :cascade do |t|
    t.bigint "shipment_id"
    t.string "description"
    t.decimal "width"
    t.decimal "length"
    t.decimal "height"
    t.integer "quantity"
    t.decimal "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shipment_id"], name: "index_shipment_items_on_shipment_id"
  end

  create_table "shipment_logs", force: :cascade do |t|
    t.bigint "shipment_id"
    t.bigint "status_id"
    t.bigint "station_id"
    t.datetime "date"
    t.string "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shipment_id"], name: "index_shipment_logs_on_shipment_id"
    t.index ["station_id"], name: "index_shipment_logs_on_station_id"
    t.index ["status_id"], name: "index_shipment_logs_on_status_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.string "service_code"
    t.bigint "status_id"
    t.bigint "consignee_id"
    t.bigint "shipper_id"
    t.string "airway_bill"
    t.string "shipping_notes"
    t.date "shipping_date"
    t.string "receive_notes"
    t.date "receive_date"
    t.decimal "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["airway_bill"], name: "index_shipments_on_airway_bill"
    t.index ["consignee_id"], name: "index_shipments_on_consignee_id"
    t.index ["shipper_id"], name: "index_shipments_on_shipper_id"
    t.index ["status_id"], name: "index_shipments_on_status_id"
  end

  create_table "shippers", force: :cascade do |t|
    t.bigint "province_id"
    t.bigint "city_id"
    t.bigint "district_id"
    t.string "name"
    t.string "phone_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_shippers_on_city_id"
    t.index ["district_id"], name: "index_shippers_on_district_id"
    t.index ["province_id"], name: "index_shippers_on_province_id"
  end

  create_table "stations", force: :cascade do |t|
    t.bigint "province_id"
    t.bigint "city_id"
    t.bigint "district_id"
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_stations_on_city_id"
    t.index ["district_id"], name: "index_stations_on_district_id"
    t.index ["province_id"], name: "index_stations_on_province_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
