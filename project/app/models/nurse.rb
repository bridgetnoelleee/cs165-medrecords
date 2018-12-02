class Nurse < ApplicationRecord
  has_many :patientinfos
  has_many :runtests
end
