class Doctor < ApplicationRecord
  has_many :analyzeordiagnoses
  has_many :medicalhistories, :through => :analyzeordiagnoses
end
