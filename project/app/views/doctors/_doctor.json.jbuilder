json.extract! doctor, :id, :docName, :specialization, :department, :fee, :schedule, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
