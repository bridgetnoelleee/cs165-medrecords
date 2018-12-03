class Patienttest < ApplicationRecord
  belongs_to :patientinfo, :optional => true
  belongs_to :labtestsresult, :optional => true
end
