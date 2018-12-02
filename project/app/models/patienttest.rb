class Patienttest < ApplicationRecord
  belongs_to :patientinfo
  belongs_to :labtestsresult
end
