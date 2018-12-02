json.extract! medicalhistory, :id, :dateAndTime, :medication, :diseaseOrCondition, :created_at, :updated_at
json.url medicalhistory_url(medicalhistory, format: :json)
