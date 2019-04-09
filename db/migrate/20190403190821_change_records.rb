class ChangeRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :current_record, :boolean
    remove_column :records, :form
    add_reference :records, :form
    add_column :records, :past_form, :string
  end
end
