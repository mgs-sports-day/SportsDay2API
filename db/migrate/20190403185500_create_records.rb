class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.float :score
      t.string :units
      t.string :holder
      t.references :form, foreign_key: true
      t.integer :year

      t.timestamps
    end
  end
end
