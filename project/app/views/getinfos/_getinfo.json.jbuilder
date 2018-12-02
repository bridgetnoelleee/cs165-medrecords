json.extract! getinfo, :id, :patientID, :nurseID, :created_at, :updated_at
json.url getinfo_url(getinfo, format: :json)
