class Patienthistory < ApplicationRecord
  belongs_to :patientinfo
  belongs_to :medicalhistory
end
