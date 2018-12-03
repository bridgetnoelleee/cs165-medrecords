class Patientinfo < ApplicationRecord
  belongs_to :nurserake
  has_many :patienttests
  has_many :patienthistories
end
