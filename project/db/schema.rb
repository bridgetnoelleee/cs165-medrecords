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

  create_table "Doctors", primary_key: "doctorID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "docName", limit: 50
    t.string "specialization", limit: 50
    t.string "department", limit: 50
    t.decimal "fee", precision: 15, scale: 2
    t.string "schedule", limit: 50
  end

  create_table "LabTestsResults", primary_key: "testID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.timestamp "dateAndTime"
    t.string "testName", limit: 50
    t.text "testResults"
  end

  create_table "MedicalHistories", primary_key: "medHisID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.timestamp "dateAndTime"
    t.text "medication"
    t.text "diseaseOrCondition"
  end

  create_table "Nurses", primary_key: "nurseID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nurseName", limit: 50
    t.string "department", limit: 50
  end

  create_table "PatientInfos", primary_key: "patientID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "nurseID", null: false
    t.string "name", limit: 50
    t.date "birthDate"
    t.string "bloodType", limit: 10
    t.string "bloodPressure", limit: 50
    t.text "medications"
    t.text "allergies"
    t.text "symptoms"
    t.integer "height", limit: 2
    t.float "weight"
    t.timestamp "dateCreated"
    t.timestamp "dateUpdated"
    t.text "emergencyContact"
    t.index ["nurseID"], name: "nurseID"
  end

  create_table "analyzeOrDiagnoses", primary_key: "adID", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "doctorID"
    t.integer "medHisID"
    t.index ["doctorID"], name: "doctorID"
    t.index ["medHisID"], name: "medHisID"
  end

  create_table "patientHistories", primary_key: "patientHisID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "patientID"
    t.integer "medHisID"
    t.index ["medHisID"], name: "medHisID"
    t.index ["patientID"], name: "patientID"
  end

  create_table "patientTests", primary_key: "patientTestID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "patientID"
    t.integer "testID"
    t.timestamp "dateAndTime"
    t.index ["patientID"], name: "patientID"
    t.index ["testID"], name: "testID"
  end

  create_table "runTests", primary_key: "runtestID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "nurseID"
    t.integer "testID"
    t.timestamp "dateAndTime"
    t.index ["nurseID"], name: "nurseID"
    t.index ["testID"], name: "testID"
  end

  add_foreign_key "PatientInfos", "Nurses", column: "nurseID", primary_key: "nurseid", name: "patientinfos_ibfk_1"
  add_foreign_key "analyzeOrDiagnoses", "Doctors", column: "doctorID", primary_key: "doctorid", name: "analyzeordiagnoses_ibfk_1"
  add_foreign_key "analyzeOrDiagnoses", "MedicalHistories", column: "medHisID", primary_key: "medhisid", name: "analyzeordiagnoses_ibfk_2"
  add_foreign_key "patientHistories", "MedicalHistories", column: "medHisID", primary_key: "medhisid", name: "patienthistories_ibfk_2"
  add_foreign_key "patientHistories", "PatientInfos", column: "patientID", primary_key: "patientid", name: "patienthistories_ibfk_1", on_delete: :cascade
  add_foreign_key "patientTests", "LabTestsResults", column: "testID", primary_key: "testid", name: "patienttests_ibfk_2"
  add_foreign_key "patientTests", "PatientInfos", column: "patientID", primary_key: "patientid", name: "patienttests_ibfk_1", on_delete: :cascade
  add_foreign_key "runTests", "LabTestsResults", column: "testID", primary_key: "testid", name: "runtests_ibfk_2", on_delete: :cascade
  add_foreign_key "runTests", "Nurses", column: "nurseID", primary_key: "nurseid", name: "runtests_ibfk_1"
end
