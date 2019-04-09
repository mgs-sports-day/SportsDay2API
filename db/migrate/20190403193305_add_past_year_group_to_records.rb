class AddPastYearGroupToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :past_year_group, :integer
  end
end
