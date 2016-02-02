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

ActiveRecord::Schema.define(version: 20160202083750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "portfolios", force: :cascade do |t|
    t.string   "name"
    t.decimal  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.datetime "start_date"
  end

  add_index "portfolios", ["user_id"], name: "index_portfolios_on_user_id", using: :btree

  create_table "prices", force: :cascade do |t|
    t.date     "date"
    t.decimal  "open"
    t.decimal  "close"
    t.integer  "volume"
    t.integer  "stock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "prices", ["stock_id"], name: "index_prices_on_stock_id", using: :btree

  create_table "stocks", force: :cascade do |t|
    t.string   "ticker"
    t.decimal  "current_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "portfolio_id"
    t.integer  "stock_id"
    t.string   "exchange"
  end

  add_index "stocks", ["portfolio_id"], name: "index_stocks_on_portfolio_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.decimal  "funds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
