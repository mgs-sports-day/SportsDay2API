class AddCompetitorToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :competitor, :string
  end
end
