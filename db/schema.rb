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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130518032445) do

  create_table "contracts", :force => true do |t|
    t.string   "contractamount"
    t.string   "name"
    t.string   "content"
    t.date     "signdate"
    t.date     "startdate"
    t.date     "finishdate"
    t.integer  "status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "projectname"
    t.string   "buyerparty"
    t.string   "projectaddr"
    t.string   "remark"
    t.string   "contractno"
    t.string   "owner"
    t.date     "deadlinedate"
    t.string   "fundsource"
  end

  create_table "drilltowers", :force => true do |t|
    t.string   "model"
    t.decimal  "height",                :precision => 10, :scale => 0
    t.decimal  "deep",                  :precision => 10, :scale => 0
    t.decimal  "effectiveload",         :precision => 10, :scale => 0
    t.string   "topsize"
    t.string   "pipequantityAndLenght"
    t.string   "sheaveQuantity"
    t.decimal  "weight",                :precision => 10, :scale => 0
    t.decimal  "workbenchHeight",       :precision => 10, :scale => 0
    t.string   "basePlatformsize"
    t.string   "manufacture"
    t.string   "manufactureContact"
    t.string   "picture"
    t.string   "remark"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  create_table "equipment", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "quantity"
    t.string   "keeper"
    t.string   "borrower"
    t.integer  "usage"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "holes", :force => true do |t|
    t.integer "designdeep"
    t.integer "actualdeep"
    t.string  "designdiameter"
    t.string  "actualdiameter"
    t.date    "finishdate"
    t.date    "startdate"
    t.integer "contract_id"
    t.string  "minearea"
    t.string  "holenumber"
    t.string  "geologysituation"
    t.string  "designapexangle"
    t.string  "actualapexangle"
    t.string  "designcoreratio"
    t.string  "actualcoreratio"
    t.string  "designbook"
    t.string  "drillingpurpose"
    t.integer "status"
    t.string  "remark"
  end

  create_table "materials", :force => true do |t|
    t.string   "name"
    t.integer  "count"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pumps", :force => true do |t|
    t.string   "pumpmodel"
    t.string   "pumpDiameter"
    t.decimal  "pumplineNumber",     :precision => 10, :scale => 0
    t.decimal  "stroke",             :precision => 10, :scale => 0
    t.decimal  "strokeTimes",        :precision => 10, :scale => 0
    t.decimal  "traffic",            :precision => 10, :scale => 0
    t.decimal  "pressure",           :precision => 10, :scale => 0
    t.decimal  "power",              :precision => 10, :scale => 0
    t.string   "overallsize"
    t.decimal  "weight",             :precision => 10, :scale => 0
    t.string   "manufacture"
    t.string   "manufactureContact"
    t.string   "picture"
    t.string   "remark"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  create_table "rigmachines", :force => true do |t|
    t.string   "rigmodel"
    t.decimal  "righoleDeep",        :precision => 10, :scale => 0
    t.decimal  "pipeDiameter",       :precision => 10, :scale => 0
    t.decimal  "rigPower",           :precision => 10, :scale => 0
    t.decimal  "rotatingSpeed",      :precision => 10, :scale => 0
    t.decimal  "rigweight",          :precision => 10, :scale => 0
    t.string   "manufacture"
    t.string   "manufactureContact"
    t.string   "overallsize"
    t.string   "picture"
    t.string   "remark"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "leader"
    t.string   "contact"
    t.integer  "memberquantity"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "tourreports", :force => true do |t|
    t.integer  "holeid"
    t.date     "tourdate"
    t.datetime "starttime"
    t.datetime "finishtime"
    t.string   "administrator"
    t.string   "tourleader"
    t.string   "recorder"
    t.string   "tourshift"
    t.string   "tourcore"
    t.string   "tourdrillingtime"
    t.string   "tourauxiliarytime"
    t.string   "remark"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "status"
  end

end
