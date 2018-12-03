class Patientinfo < ApplicationRecord
  belongs_to :nurse, :optional =>true
  has_many :patienttests
  has_many :patienthistories
end
