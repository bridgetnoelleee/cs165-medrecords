json.extract! patienttest, :id, :patientID, :testID, :dateAndTime, :created_at, :updated_at
json.url patienttest_url(patienttest, format: :json)
