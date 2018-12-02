json.extract! currentmedical, :id, :dateCreated, :dateUpdated, :medications, :allergies, :symptoms, :bloodPressure, :height, :weight, :created_at, :updated_at
json.url currentmedical_url(currentmedical, format: :json)
