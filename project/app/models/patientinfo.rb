class Patientinfo < ApplicationRecord
  belongs_to :nurse
  belongs_to :currentmedical
  has_many :patienttests
  has_many :patienthistories
end
