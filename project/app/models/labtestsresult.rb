class Labtestsresult < ApplicationRecord
  has_many :runtests
  has_many :patienttests
end
