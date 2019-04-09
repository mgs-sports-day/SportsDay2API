class AddLocationToAllocation < ActiveRecord::Migration[5.2]
  def change
    add_column :allocations, :location, :string
  end
end
