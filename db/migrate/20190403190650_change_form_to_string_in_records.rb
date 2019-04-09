class ChangeFormToStringInRecords < ActiveRecord::Migration[5.2]
  def change
    remove_reference :records, :form
    add_column :records, :form, :string
  end
end
