class AddEventToRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :records, :event, foreign_key: true
  end
end
