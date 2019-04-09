class AddCompetitorToAllocations < ActiveRecord::Migration[5.2]
  def change
    add_column :allocations, :competitor, :string
    add_column :allocations, :year_group, :integer
  end
end
