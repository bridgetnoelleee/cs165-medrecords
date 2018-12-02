json.extract! patientinfo, :id, :currMedID, :name, :birthDate, :bloodType, :dateCreated, :dateUpdated, :emergencyContact, :created_at, :updated_at
json.url patientinfo_url(patientinfo, format: :json)
