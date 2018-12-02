json.extract! labtestsresult, :id, :testID, :dateAndTime, :testName, :testResults, :created_at, :updated_at
json.url labtestsresult_url(labtestsresult, format: :json)
