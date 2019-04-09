class AddWorldRecordHolderToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :world_record_holder, :string
  end
end
