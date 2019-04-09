class AddScoreUnitsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :score_units, :string
  end
end
