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

ActiveRecord::Schema.define(version: 0) do

  create_table "analyzeordiagnose", primary_key: ["doctorID", "medHisID"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "doctorID", null: false
    t.integer "medHisID", null: false
    t.index ["medHisID"], name: "medHisID"
  end

  create_table "currentmedical", primary_key: "currMedID", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.timestamp "dateCreated"
    t.timestamp "dateUpdated"
    t.text "medications"
    t.text "allergies"
    t.text "symptoms"
    t.string "bloodPressure", limit: 50
    t.integer "height", limit: 2
    t.float "weight"
  end

  create_table "doctor", primary_key: "doctorID", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "docName", limit: 50
    t.string "specialization", limit: 50
    t.string "department", limit: 50
    t.decimal "fee", precision: 15, scale: 2
    t.string "schedule", limit: 50
  end

  create_table "getinfo", primary_key: ["patientID", "nurseID"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "patientID", null: false
    t.integer "nurseID", null: false
    t.index ["nurseID"], name: "nurseID"
  end

  create_table "labtestsresults", primary_key: ["testID", "dateAndTime"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "testID", null: false
    t.timestamp "dateAndTime", null: false
    t.string "testName", limit: 50
    t.text "testResults"
    t.index ["testID"], name: "testID"
  end

  create_table "medicalhistory", primary_key: "medHisID", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.timestamp "dateAndTime"
    t.text "medication"
    t.text "diseaseOrCondition"
  end

  create_table "nurse", primary_key: "nurseID", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nurseName", limit: 50
    t.string "department", limit: 50
  end

  create_table "patienthistory", primary_key: ["patientID", "medHisID"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "patientID", null: false
    t.integer "medHisID", null: false
    t.index ["medHisID"], name: "medHisID"
  end

  create_table "patientinfo", primary_key: "patientID", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "currMedID"
    t.string "name", limit: 50
    t.date "birthDate"
    t.string "bloodType", limit: 10
    t.timestamp "dateCreated"
    t.timestamp "dateUpdated"
    t.text "emergencyContact"
    t.index ["currMedID"], name: "currMedID"
  end

  create_table "patienttest", primary_key: ["patientID", "testID", "dateAndTime"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "patientID", null: false
    t.integer "testID", null: false
    t.timestamp "dateAndTime", null: false
    t.index ["testID", "dateAndTime"], name: "testID"
  end

  create_table "runtest", primary_key: ["nurseID", "testID", "dateAndTime"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "nurseID", null: false
    t.integer "testID", null: false
    t.timestamp "dateAndTime", null: false
    t.index ["testID", "dateAndTime"], name: "testID"
  end

  add_foreign_key "analyzeordiagnose", "doctor", column: "doctorID", primary_key: "doctorid", name: "analyzeordiagnose_ibfk_1"
  add_foreign_key "analyzeordiagnose", "medicalhistory", column: "medHisID", primary_key: "medhisid", name: "analyzeordiagnose_ibfk_2"
  add_foreign_key "getinfo", "nurse", column: "nurseID", primary_key: "nurseid", name: "getinfo_ibfk_2"
  add_foreign_key "getinfo", "patientinfo", column: "patientID", primary_key: "patientid", name: "getinfo_ibfk_1", on_delete: :cascade
  add_foreign_key "patienthistory", "medicalhistory", column: "medHisID", primary_key: "medhisid", name: "patienthistory_ibfk_2"
  add_foreign_key "patienthistory", "patientinfo", column: "patientID", primary_key: "patientid", name: "patienthistory_ibfk_1", on_delete: :cascade
  add_foreign_key "patientinfo", "currentmedical", column: "currMedID", primary_key: "currmedid", name: "patientinfo_ibfk_1", on_delete: :cascade
end