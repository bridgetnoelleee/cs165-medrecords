class Medicalhistory < ApplicationRecord
  has_many :analyzeordiagnoses
  has_many :doctors, :through => :analyzeordiagnoses
  has_many :patienthistories
end
