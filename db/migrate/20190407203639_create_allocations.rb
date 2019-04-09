class CreateAllocations < ActiveRecord::Migration[5.2]
  def change
    create_table :allocations do |t|
      t.time :starts_at
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
