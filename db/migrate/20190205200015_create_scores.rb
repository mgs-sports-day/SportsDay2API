class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.references :event, foreign_key: true
      t.references :form, foreign_key: true
      t.integer :score
      t.string :competitor

      t.timestamps
    end
  end
end
