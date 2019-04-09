class AddWorldRecordToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :world_record, :string
  end
end
