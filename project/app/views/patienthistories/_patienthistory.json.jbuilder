json.extract! patienthistory, :id, :patientID, :medHisID, :created_at, :updated_at
json.url patienthistory_url(patienthistory, format: :json)
