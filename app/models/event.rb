class Event < ApplicationRecord
  has_many :scores
  has_many :records
end
