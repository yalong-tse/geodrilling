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

ActiveRecord::Schema.define(:version => 20130613014108) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "assignments", ["role_id"], :name => "index_assignments_on_role_id"
  add_index "assignments", ["user_id"], :name => "index_assignments_on_user_id"

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

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.string   "depcode"
    t.string   "head"
    t.string   "phone"
    t.string   "address"
    t.string   "remark"
    t.string   "ancestry"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "deviceresumes", :force => true do |t|
    t.string   "devicenumber"
    t.string   "devicetype"
    t.date     "operatedate"
    t.string   "operatetype"
    t.string   "operator"
    t.string   "holenumber"
    t.string   "remark"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "dictionaries", :force => true do |t|
    t.string   "type"
    t.string   "item"
    t.boolean  "delflag"
    t.decimal  "priority",   :precision => 10, :scale => 0
    t.string   "remark"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "dictype"
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
    t.string   "name"
    t.string   "devicenumber"
    t.boolean  "status"
    t.boolean  "groupstatus"
    t.decimal  "rigmachineid",          :precision => 10, :scale => 0
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
    t.string   "type"
    t.string   "model"
    t.decimal  "count",        :precision => 10, :scale => 0
    t.decimal  "price",        :precision => 10, :scale => 0
    t.date     "stockdate"
    t.string   "recorder"
    t.string   "remark"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "materialtype"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "subject_class"
    t.string   "action"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "permissions_roles", :id => false, :force => true do |t|
    t.integer "permission_id"
    t.integer "role_id"
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
    t.string   "name"
    t.string   "devicenumber"
    t.boolean  "status"
    t.boolean  "groupstatus"
    t.decimal  "rigmachineid",       :precision => 10, :scale => 0
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
    t.string   "name"
    t.string   "devicenumber"
    t.boolean  "status"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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

  create_table "tourreportworkcontents", :force => true do |t|
    t.integer  "tourreport_id"
    t.time     "starttime"
    t.time     "finishtime"
    t.string   "workcontent"
    t.string   "drillfootage"
    t.string   "drillbit"
    t.string   "rotatespeed"
    t.string   "pumppressure"
    t.string   "pumpquantity"
    t.string   "coresamplelength"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "transferrecords", :force => true do |t|
    t.string   "devicenumber"
    t.string   "devicetype"
    t.date     "borrowdate"
    t.string   "borrower"
    t.string   "holenumber"
    t.string   "return"
    t.date     "returndate"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "useroperations", :force => true do |t|
    t.string   "username"
    t.string   "useraccount"
    t.decimal  "userid",         :precision => 10, :scale => 0
    t.string   "userip"
    t.datetime "operatetime"
    t.string   "operatecontent"
    t.string   "remark"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "sex"
    t.date     "birthday"
    t.string   "duty"
    t.string   "education"
    t.string   "mobile"
    t.string   "officephone"
    t.string   "email"
    t.boolean  "isappuser"
    t.integer  "department_id"
    t.string   "account"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["department_id"], :name => "index_users_on_department_id"

end
