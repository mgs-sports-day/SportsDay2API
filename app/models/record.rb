class Record < ApplicationRecord
  belongs_to :form, optional: true
  belongs_to :event
end
